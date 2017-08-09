//
//  User.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/21.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var id :String!
    var pwd  :String!
    
    override init()
    {
        super.init()
        setDefault()
    }
    
    func setDefault()
    {
        
    }
    
    func getUser() ->Bool
    {
        id = UserDefaults.standard.object(forKey: UserDefault.login_name) as! String
        pwd  = UserDefaults.standard.object(forKey: UserDefault.login_pwd) as! String
        if id != nil && pwd != nil
        {
            return true
        }
        return false
    }

}
