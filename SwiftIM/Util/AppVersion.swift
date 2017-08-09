//
//  AppVersion.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/20.
//  Copyright © 2017年 rooten. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication
{    
    var appVersion : String? {
        get {
            let dict : [String : String] = Bundle.main.infoDictionary! as! [String : String];
            let version :String = dict["CFBundleShortVersionString"]!
            return version
        }
    }
}
