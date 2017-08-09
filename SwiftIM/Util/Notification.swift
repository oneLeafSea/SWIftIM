//
//  Notification.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/21.
//  Copyright © 2017年 rooten. All rights reserved.
//

import Foundation
import UIKit

extension Notification {
    var keyBoardFrame_begin :CGRect
        {
        if let val = self.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue
        {
            return val.cgRectValue
        }
        return CGRect.zero
        
    }
    
    var keyBoardFrame_end : CGRect
    {
        if let val = self.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
        {
            return val.cgRectValue
        }
        return CGRect.zero
    }
    
}
