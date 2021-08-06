//
//  UIStoryboard+InstantiateViewController.swift
//  SwiftUtilityCollection
//
//  Created by Bortas, Flavius on 2/1/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    /// Returns Inital Generic Instantiated ViewController
    /// - Parameter type: Generic Type
    /// - Returns: Generic<T> ViewController
    func instantiateInitialViewController<T>(as type: T.Type) -> T {
        guard let initialViewController = instantiateInitialViewController() else {
            fatalError("Expected initialViewController in storyboard: \(self)")
        }
        
        return GenericCasting.forceCast(initialViewController, to: type)
    }
    
    /// Returns Inital Generic Instantiated ViewController
    /// - Parameters:
    ///   - identifier: ViewControllers Identifier
    ///   - type: Generic Type
    /// - Returns: Generic<T> ViewController
    func instantiateViewController<T>(withIdentifier identifier: String, as type: T.Type) -> T {
        return GenericCasting.forceCast(instantiateViewController(withIdentifier: identifier), to: type)
    }
}
