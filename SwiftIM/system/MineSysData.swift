//
//  MineSysData.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/25.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class MineSysData: NSObject {
    
    static let shareInstance = MineSysData()
    
    var mineDic : [String : String] = [String : String].init()
    
    var mine_tDic : [String : [String]] = [String : [String]].init()
    
    let infoArr = ["状态","性别","电话","区域","职位","邮箱","设置"]
    
    func setMineDictionary() ->[String : String]
    {
        mineDic["状态"] = "在线"
        mineDic["性别"] = "男"
        mineDic["电话"] = "15189967083"
        mineDic["区域"] = "苏州园区腾飞软件"
        mineDic["职位"] = "软件工程师"
        mineDic["邮箱"] = "335629146@qq.com"
        mineDic["设置"] = ""
        return mineDic
    }
    
    func getTestDictionary() ->[String : [String]]{
        mine_tDic["user"] = ["状态","区域","职位","电话","性别"]
        mine_tDic["sys"]  = ["设置","邮箱"]
        return mine_tDic
    }
    
   

}
