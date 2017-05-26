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

#import <Foundation/Foundation.h>
#import "IOKit.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <mach/machine.h>

#define kEEIOKitListenerNewDataNotification @"EEIOKitListenerNewDataNotification"

@interface EEIOKitListener : NSObject
{
    mach_port_t	masterPort;
    io_registry_entry_t charger_entry;
    BOOL listenerActive;
    IONotificationPortRef notificationPort;
    CFRunLoopSourceRef notificationRunLoopSource;
}

@property NSDictionary *chargerDict;
@property NSDictionary *sharePowerSource;
@property NSDictionary *sharePower;

+ (instancetype) sharedEEIOKitListener;
- (NSString *)getCPUType;
- (void) startListener;
- (void) requestDataRefresh;
- (void) stopListener;
@end
