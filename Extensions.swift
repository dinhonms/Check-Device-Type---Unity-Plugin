//
//  Extensions.swift
//  CheckDeviceType
//
//  Created by Nonato Sousa on 16/10/23.
//

import Foundation

extension Bundle{
    static var buildNumber: String{
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String? ?? "1"
    }
}
