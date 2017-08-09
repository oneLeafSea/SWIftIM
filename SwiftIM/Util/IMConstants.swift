//
//  IMConstants.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/20.
//  Copyright © 2017年 rooten. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    var IM_DELEGATE : UIApplicationDelegate {
        get {
            return UIApplication.shared.delegate as! IMAppDelegate
        }
    }
}
