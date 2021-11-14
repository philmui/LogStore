//
//  File.swift
//  
//
//  Created by Phil Mui on 11/13/21.
//

import Foundation

struct Utilities {
    static func getTimestamp() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return format.string(from: date)
    }
}
