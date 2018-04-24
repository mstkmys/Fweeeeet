//
//  DateFormatter.swift
//  Fweeeeet
//
//  Created by Miyoshi Masataka on 2018/04/25.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

extension DateFormatter {
    
    public static var myFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }
    
}























