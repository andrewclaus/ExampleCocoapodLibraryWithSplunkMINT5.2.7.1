//
//  UIColor+Hex.swift
//  SwiftUtilityCollection
//
//  Created by Bortas, Flavius on 2/1/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// Initialize a UIColor using HexString with the given alpha
    /// - Parameters:
    ///   - hex: Hexidecimal String
    ///   - alpha: Colors Alpha value
    convenience init(hex: String, alpha: CGFloat = 1) {
        
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
        
        var rgb: UInt32 = 0
        let scanner = Scanner(string: hex)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt32(&rgb)
        
        let hexInt = Int(rgb)
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha
        self.init(red: red, green: green, blue: blue, alpha: alpha)
        
    }
}
