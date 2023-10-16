//
//  UnityBridge.swift
//  CheckDeviceType
//
//  Created by Nonato Sousa on 09/10/23.
//

import Foundation

@_cdecl("getDeviceType")
public func getDeviceType() -> Int{
    let deviceType = DeviceType.getDeviceType()
    
    print("[Swift] Device type from swift: \(deviceType)")
    
    return deviceType
}

@_cdecl("getDeviceIdentifier")
public func getDeviceIdentifier() -> Int{
    let deviceIdentifier = DeviceType.getDeviceIdentifier()
    
    print("[Swift] Device identifier: \(String(describing: deviceIdentifier))")
    
    return deviceIdentifier
}

@_cdecl("getBuildNumber")
public func getBuildNumber() -> Int{
    let buildNumber = Int(DeviceType.getBuildNumber())
    
    print("[Swift] Build number: \(String(describing: buildNumber))")
    
    return buildNumber ?? 1
}
