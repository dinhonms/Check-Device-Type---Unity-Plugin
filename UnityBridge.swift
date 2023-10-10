//
//  UnityBridge.swift
//  CheckDeviceType
//
//  Created by Nonato Sousa on 09/10/23.
//

import Foundation

@_cdecl("getDeviceType")
public func getDeviceType() -> Int{
    DeviceType.getDeviceType()
}

@_cdecl("getDeviceIdentifier")
public func getDeviceIdentifier() -> Int{
    DeviceType.getDeviceIdentifier()
}
