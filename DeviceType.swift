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
        let deviceType = UIDevice.current.userInterfaceIdiom.rawValue
        
        print("[Swift] Device type from swfit: \(deviceType)")
        
        return deviceType
    }
    
    ///Get the device identifier in pattern 11, 12 and so on.
    ///Ref: https://www.theiphonewiki.com/wiki/Models
    public static func getDeviceIdentifier() -> Int {
        let deviceIdentifier = -1
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
            }
        }
        
        //iPhone13,3
        //split into two strings: "iPhone13" and "3"
        guard let splitFullName = modelCode?.split(separator: ",") else {
            return -1
        }
        
        print("Device full identifier: \(String(describing: modelCode))")
        
        guard let nameAndNumber = splitFullName.first else {
            return -1
        }
        
        print("Name and number: \(nameAndNumber)")
        
        if nameAndNumber.contains("iPhone") {
            if let result = Int(nameAndNumber.replacingOccurrences(of: "iPhone", with: "", options: NSString.CompareOptions.literal, range: nil)){
                
                print("[Swift] Device identifier: \(String(describing: result))")
                
                return result
            }
        }
        
        print("[Swift] Device identifier: \(String(describing: deviceIdentifier))")
        
        return deviceIdentifier
    }
}
