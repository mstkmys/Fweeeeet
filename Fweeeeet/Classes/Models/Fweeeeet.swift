//
//  Fweeeeet.swift
//  Fweeeeet
//
//  Created by Miyoshi Masataka on 2018/04/25.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Firebase

protocol DocumentSerializeble {
    init?(dictonary: [String: Any])
}

struct Fweeeeet {
    var name: String
    var content: String
    var timeStamp: Date
    var dictonary: [String: Any] {
        return [
            "name": name,
            "conten": content,
            "timeStamp": timeStamp
        ]
    }
}

extension Fweeeeet: DocumentSerializeble {
    init?(dictonary: [String : Any]) {
        guard
            let name = dictonary["name"] as? String,
            let content = dictonary["content"] as? String,
            let timeStamp = dictonary["timeStamp"] as? Date
        else {
            return nil
        }
        self.init(name: name, content: content, timeStamp: timeStamp)
    }
}





















