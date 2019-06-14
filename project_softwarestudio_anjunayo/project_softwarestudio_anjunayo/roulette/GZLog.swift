//
//  GZLog.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 21/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation

let GZLOG_FLAG: Bool = true

class GZLogUtil {
    
    static var formatter: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return format
    }()
    
    class func notNilObj(_ obj: Any?) -> Any {
        if let a: Any = obj {
            return a
        }
        return "nil"
    }
}

func fileNameOfFile(_ file: String) -> String {
    let fileParts = file.components(separatedBy: "/")
    if let lastPart = fileParts.last {
        return lastPart
    }
    return ""
}

func GZLogFunc(_ message: @autoclosure () -> Any? = "", function: String = #function, file: String = #file, line: Int = #line) -> Void {
    if GZLOG_FLAG == false {
        return
    }
    print("\(GZLogUtil.formatter.string(from: Date())) [\(fileNameOfFile(file)) \(function)](\(line)) \(GZLogUtil.notNilObj(message()))")
}
