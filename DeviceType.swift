//
//  DeviceType.swift
//  CheckDeviceType
//
//  Created by Nonato Sousa on 09/10/23.
//

import UIKit

final class DeviceType{
    
    ///Get device type as phone, pad, and so on
    public static func getDeviceType() -> Int{
        var deviceType = UIDevice.current.userInterfaceIdiom.rawValue
        
        print("Device type from swfit: \(deviceType)")
        
        
        return deviceType
    }
    
    ///Get the device identifier in pattern iPhone11,2
    public static func getDeviceIdentifier() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
            }
        } ?? "Device identifier not found"
        
        print("Device identifier: \(String(describing: modelCode))")
        
        return modelCode
    }
}
