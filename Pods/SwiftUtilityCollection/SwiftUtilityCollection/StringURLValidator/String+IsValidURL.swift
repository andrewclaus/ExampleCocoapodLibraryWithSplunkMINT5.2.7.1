//
//  String+ IsValidURL.swift
//  SwiftUtilityCollection
//
//  Created by Bortas, Flavius on 6/21/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import Foundation

// https://stackoverflow.com/questions/28079123/how-to-check-validity-of-url-in-swift/49072718#49072718

public extension String {
    var isValidURL: Bool {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector?.firstMatch(in: self, options: [], range: NSRange(location: 0, length: utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == utf16.count
        } else {
            return false
        }
    }
}
