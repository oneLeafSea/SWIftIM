//
//  CheckItem.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/24.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class CheckItem: NSObject {
    
    static let userNameRegex = "^[A-Za-z0-9]{6,18}$"
    
    static func enterFormatCheck(name:String) ->Bool
    {
        
        let userNamePredicate = NSPredicate(format: "SELF MATCHES %@", userNameRegex)
        let boolSuccess = userNamePredicate.evaluate(with: name)
        return boolSuccess
        
    }

    
    func check(name:String,pwd:String)->Bool
    {
        let nameSys : String = UserDefaults.standard.object(forKey: UserDefault.system_name) as! String
        let pwdSys  : String  = UserDefaults.standard.object(forKey: UserDefault.system_pwd) as! String
        if name.isEmpty || (name != nameSys) {
            return false
        }
        if pwdSys.isEmpty || pwdSys != pwdSys {
            return false
        }
        
        return true
    }

}
