//
//  String+EvaluateRegex.swift
//  SwiftUtilityCollection
//
//  Created by Layton, James on 6/18/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import Foundation

public extension String {
    func evaluate(regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
