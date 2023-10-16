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
        return UIDevice.current.userInterfaceIdiom.rawValue
    }
    
    ///Get the device identifier in pattern 11, 12 and so on.
    ///Ref: https://www.theiphonewiki.com/wiki/Models
    public static func getDeviceIdentifier() -> Int {
        ///iPhone 12 identifier
        let deviceIdentifier = 13
        
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
            print("[Swift] Failed to split Device identifier!")
            
            return deviceIdentifier
        }
        
        print("[Swift] Device full identifier: \(String(describing: modelCode))")
        
        guard let nameAndNumber = splitFullName.first else {
            print("[Swift] Failed to split Device full identifier!")
            
            return deviceIdentifier
        }
        
        if nameAndNumber.contains("iPhone") {
            if let result = Int(nameAndNumber.replacingOccurrences(of: "iPhone", with: "", options: NSString.CompareOptions.literal, range: nil)){
                
                print("[Swift] Device identifier: \(String(describing: result))")
                
                return result
            }
        }
        
        else {
            print("[Swift] Device identifier: \(String(describing: modelCode))")
        }
        
        return deviceIdentifier
    }
    
    public static func getBuildNumber() -> String{
        return Bundle.buildNumber
    }
}
