/*
 *
 *    Copyright (C) 2016 Eldad Eilam
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This Program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#import "EEIOKitListener.h"

@implementation EEIOKitListener

+ (instancetype) sharedEEIOKitListener
{
    static EEIOKitListener *listener;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        listener = [[EEIOKitListener alloc] init];
    });
    
    return listener;
}



- (instancetype) init
{
    self = [super init];
    
    IOMasterPort(MACH_PORT_NULL, &masterPort);
    _sharePower = CFBridgingRelease(IOPSCopyExternalPowerAdapterDetails());
     CFTypeRef *draven = IOPSCopyPowerSourcesInfo();
     _sharePowerSource = CFBridgingRelease(IOPSCopyPowerSourcesList(draven));
    
     CFMutableDictionaryRef serviceDict = IOServiceMatching("AppleARMPMUCharger");
    charger_entry = IOServiceGetMatchingService(masterPort, serviceDict);
    
    return self;
}

- (void) chargerObjectRefreshed
{
    CFMutableDictionaryRef chargerProperties = nil, armPMUChargerProperties;
    
    IORegistryEntryCreateCFProperties( charger_entry, &armPMUChargerProperties,
                                            kCFAllocatorDefault,
                                            kNilOptions);
    
    _chargerDict = (__bridge NSDictionary *)(armPMUChargerProperties);

    [[NSNotificationCenter defaultCenter] postNotificationName:kEEIOKitListenerNewDataNotification object:self userInfo:_chargerDict];
}

void ARMPMUStateChanged( void *listenerInstance, io_service_t service, uint32_t messageType, void *messageArgument )
{
    [((__bridge EEIOKitListener *) listenerInstance) chargerObjectRefreshed];
}

- (void) requestDataRefresh
{
    [self chargerObjectRefreshed];
}

- (void) startListener
{
    if (listenerActive == NO)
    {
        // Set up auto notifications for our charger object:
        notificationPort = IONotificationPortCreate(masterPort);
        notificationRunLoopSource = IONotificationPortGetRunLoopSource(notificationPort);
        CFRunLoopAddSource([[NSRunLoop currentRunLoop] getCFRunLoop], notificationRunLoopSource, kCFRunLoopDefaultMode);
        
        io_object_t notificationObject;
        
        IOServiceAddInterestNotification(notificationPort,
                                               charger_entry,
                                               kIOGeneralInterest,
                                               ARMPMUStateChanged,
                                               (__bridge void *) self,
                                               &notificationObject);
        listenerActive = YES;        
    }
}

- (void) stopListener
{
    if (listenerActive == YES)
    {
        if (CFRunLoopSourceIsValid(notificationRunLoopSource) == YES)
        {
            CFRunLoopSourceInvalidate(notificationRunLoopSource);
        }
        
        if (CFRunLoopContainsSource([[NSRunLoop currentRunLoop] getCFRunLoop], notificationRunLoopSource, kCFRunLoopDefaultMode))
        {
            CFRunLoopRemoveSource([[NSRunLoop currentRunLoop] getCFRunLoop], notificationRunLoopSource, kCFRunLoopDefaultMode);
        }
        
        IONotificationPortDestroy(notificationPort);
        
        listenerActive = NO;
    }
}
- (NSString *)getCPUType {
    
    NSMutableString *cpu = [[NSMutableString alloc] init];
    size_t size;
    cpu_type_t type;
    cpu_subtype_t subtype;
    size = sizeof(type);
    sysctlbyname("hw.cputype", &type, &size, NULL, 0);
    
    size = sizeof(subtype);
    sysctlbyname("hw.cpusubtype", &subtype, &size, NULL, 0);
    
    // values for cputype and cpusubtype defined in mach/machine.h
    if (type == CPU_TYPE_X86)
    {
        [cpu appendString:@"x86 "];
    } else if (type == CPU_TYPE_ARM64)
    {
        [cpu appendString:@"ARM"];
        switch(subtype)
        {
            case CPU_SUBTYPE_ARM_V7:
                [cpu appendString:@"V7"];
                break;
        }
    }
    if (type == CPU_TYPE_X86_64) {
        [cpu appendString:@"x86_64"];
    } else if (type == CPU_TYPE_X86) {
        [cpu appendString:@"x86"];
    } else if(type == CPU_TYPE_ARM64) {
        [cpu appendString:@"x64"];
    } else if (type == CPU_TYPE_ARM) {
        [cpu appendString:@"ARM"];
        switch(subtype)
        {
            case CPU_SUBTYPE_ARM_V6:
                [cpu appendString:@"V6"];
                break;
            case CPU_SUBTYPE_ARM_V7:
                [cpu appendString:@"V7"];
                break;
            case CPU_SUBTYPE_ARM_V8:
                [cpu appendString:@"V8"];
                break;
        }
    }
    return cpu;
}



@end
