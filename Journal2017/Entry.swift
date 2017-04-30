//
//  Entry.swift
//  Journal2017
//
//  Created by Patrick Pahl on 4/29/17.
//  Copyright © 2017 Patrick Pahl. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let textKey = "text"
    private let timestampKey = "timestamp"
    
    var text: String
    let timestamp: Date
    
    init(text: String) {
        self.text = text
        self.timestamp = Date()
    }
    
    init?(dictionary: [String: Any]) {
        guard let text = dictionary[textKey] as? String,
            let timestamp = dictionary[timestampKey] as? Date else {
                return nil}
        self.text = text
        self.timestamp = timestamp
    }
    
    var toDictionary: [String: Any]{
        return [textKey: text, timestampKey: timestamp]
    }
    
    func includesText(text: String) -> Bool {
        return self.text.lowercased().contains(text.lowercased())
    }
}


func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.text == rhs.text && lhs.timestamp == rhs.timestamp
}

