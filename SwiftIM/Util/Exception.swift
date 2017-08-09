//
//  Exception.swift
//  珠海人员核查swift
//
//  Created by 冯学仕 on 17/6/15.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class Exception: NSObject {
    
  static  func exceptionDetails()
    {
        NSSetUncaughtExceptionHandler { (exception : NSException) in
            
            let bodyString:NSArray = exception.callStackSymbols as NSArray
            DEBUG_LogInfo(bodyString)
            
            let reasonBody:String? = exception.reason
            DEBUG_LogInfo(reasonBody)
        }
    }
    
    static func isEmptyWithVaule(value:String)->Bool
    {
        return value == "" ? false:true
    }
    
    
}
