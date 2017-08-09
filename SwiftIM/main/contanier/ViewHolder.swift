//
//  ViewHolder.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/26.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class ViewHolder: NSObject {
    
    var viewDictionary : [String : [Any]] = [String : [Any]].init()
    var contentDic     : [String : String] = [String : String].init()
    var users : [OnlinePeople] = [OnlinePeople].init()
    
    func setDic() {
        contentDic["group"] = "群"
        contentDic["container"] = "联系人"
    }
    
    func setViewDic() {
        viewDictionary["head"] = ["群","联系人"]
        viewDictionary["body"] = users
    }
}
