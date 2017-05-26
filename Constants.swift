//
//  Constants.swift
//  Battery Main
//
//  Created by MAC on 5/16/17.
//  Copyright © 2017 example.com. All rights reserved.
//
import UIKit
let constantCapactiyDevice: Dictionary<String, Int> = ["iPhone 3G":  1200, "iPhone 3GS": 1200, "iPhone 4":  1420, "iPhone 4S":1420, "iPhone 5": 1440,"iPhone 5c": 1510, "iPhone 5s": 1560, "iPhone 6": 1810, "iPhone 6 Plus": 2915,"iPhone 6s": 1715,"iPhone 6s Plus": 2750,"iPhone SE": 1642, "iPhone 7": 1960,"iPhone 7 Plus": 2900,
                                                       "iPad 1": 6600,
                                                       "iPad 2": 6930, "iPad 3": 11560, "iPad 4": 11560,
                                                       
                                                       "iPad Mini": 4490, "iPad Mini 2": 6471, "iPad Mini 3": 6470, "iPad Mini 4": 6470,
                                                       
                                                       "iPad Air": 8820, "iPad Air 2": 7340,
                                                       
                                                       "iPad Pro 9.7 inch": 7350, "iPad Pro 12.9 inch": 10300, "iPad (5th generation)": 7300]

let constantTimeRemaining : Dictionary<String, [Double]> = [
    "iPhone 3G":  [5, 0 ,9, 10, 24, 300],
    "iPhone 3GS": [5, 5, 9, 10, 30, 300],
    "iPhone 4":  [7 , 6, 10, 10, 40 , 300],
    "iPhone 4S":[8, 6, 9, 10, 40, 200],
    "iPhone 5": [8, 8, 10, 10, 40 , 225],
    "iPhone 5c": [10, 8, 10 , 10, 40 , 250],
    "iPhone 5s": [10, 8, 10, 10, 40, 240],
    "iPhone 6": [14, 10, 11, 11, 50, 240],
    "iPhone 6 Plus": [24, 12, 12, 14, 80, 384],
    "iPhone 6s": [14, 10, 10, 11, 50 , 240],
    "iPhone 6s Plus": [24, 12, 12, 14 , 80, 384],
    "iPhone SE": [14, 12, 13, 13, 50 , 10],
    "iPhone 7": [14, 12, 14, 13, 40, 240],
    "iPhone 7 Plus": [21, 13, 15, 14, 60, 384],
    "iPad 1": [0, 9, 10, 10 , 10, 200],
    "iPad 2": [10, 9, 10, 10, 10, 200],
    "iPad 3": [10, 9, 10, 10, 10, 200],
    "iPad 4": [10, 9, 10, 10, 10, 200],
    "iPad Mini": [10, 9, 10, 10, 10, 200],
    "iPad Mini 2": [10, 9, 10, 10, 10, 200],
    "iPad Mini 3": [10, 9, 10, 10, 10, 200],
    "iPad Mini 4": [10, 9, 10, 10, 10, 200],
    "iPad Air": [10, 9, 10, 10, 10, 200]  ,
    "iPad Air 2": [10, 9, 10, 10, 10, 200],
    "iPad Pro 9.7 inch": [10, 9, 10, 10, 10, 200],
    "iPad Pro 12.9 inch": [10, 9, 10, 10, 10, 200],
    "iPad (5th generation)": [10, 9, 10, 10, 10, 200]
]

let detailCPU: Dictionary<String,[String]> = [
"ARM Cortex-A8": ["1","1000", "32", "32", "512", "PowerVR SGX535"],
"Apple A5": ["2", "1000", "32", "32", "1024", "PowerVR SGX543MP2"],
"Apple A5X": ["2", "1000", "32","32", "1024", "PowerVR SGX543MP4"],
"Apple A6": ["2", "1300", "32", "32", "1024", "PowerVR SGX543MP3"],
"Apple A6X": ["2", "1400", "32", "32", "1024", "PowerVR SGX554MP4"],
"Apple A7": ["2", "1400", "64", "64", "1024", "PowerVR G6430"],
"Apple A8": ["2"," 1400", "64", "64", "1024", "PowerVR  GX6450"],
"Apple A8X": ["3", "1500", "64", "64", "2048", "PowerVR  GXA6850"],
"Apple A9": ["2", "1850", "64", "64", "3072", "PowerVR GT7600"],
"Apple A9X": ["2", "2260", "64", "64", "3072", "PowerVR Series7XT"],
"Apple A10":["4", "2340","64", "64", "3072", "PowerVR GT7600 Plus"]
]

let cpuForDeviceName: Dictionary< String, String> = [
"iPhone 3G":"ARM Cortex-A8", "iPhone 3GS":"ARM Cortex-A8", "iPhone 4":"ARM Cortex-A8",  "iPad 1":"ARM Cortex-A8",
"iPhone 4S":"Apple A5", "iPad 2": "Apple A5","iPad Mini": "Apple A5",
"iPhone 5":"Apple A6","iPhone 5c":"Apple A6",
"iPad 3":"Apple A5X",
"iPad 4":"Apple A6X",
"iPhone 5s":"Apple A7","iPad Mini 2":"Apple A7", "iPad Mini 3":"Apple A7",   "iPad Air":"Apple A7",
"iPhone 6":"Apple A8", "iPhone 6 Plus":"Apple A8", "iPad Mini 4":"Apple A8",
"iPad Air 2":"Apple A8X",
"iPhone 6s":"Apple A9",  "iPhone 6s Plus":"Apple A9", "iPhone SE":"Apple A9","iPad (5th generation)":"Apple A9",
"iPad Pro 9.7 inch":"Apple A9X", "iPad Pro 12.9 inch":"Apple A9X",
"iPhone 7":"Apple A10", "iPhone 7 Plus": "Apple A10"
]

