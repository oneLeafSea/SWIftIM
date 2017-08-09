//
//  SwiftPch.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/24.
//  Copyright © 2017年 rooten. All rights reserved.
//

import Foundation

func DEBUG_LogInfo(filePath: String = #file, rowCount: Int = #line) {
    #if DEBUG
        let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
        print("LOG:"+fileName + "/" + "\(rowCount)" + "\n")
    #endif
}

func DEBUG_LogInfo<T>(_ message: T, filePath: String = #file, rowCount: Int = #line) {
    #if DEBUG
        let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
        print("LOG:"+fileName + "/" + "\(rowCount)" + " \(message)" + "\n")
    #endif
}



