//
//  GenericCasting.swift
//  SwiftUtilityCollection
//
//  Created by Bortas, Flavius on 2/1/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import Foundation

class GenericCasting {
    
    // This should ONLY be used when we can guarantee this force cast will not crash in production.
    // Used primarily used for casting UITableViewCells and UIViewControllers from the storyboard.
    // Inspired from: https://stackoverflow.com/a/47845154/8672529
    static func forceCast<T>(_ object: Any, to type: T.Type) -> T {
        guard let typedObject = object as? T else {
            fatalError("Failed to force cast object to \(type)")
        }
        
        return typedObject
    }
}
