//
//  UITableView+DequeueReusableCell.swift
//  SwiftUtilityCollection
//
//  Created by Bortas, Flavius on 2/1/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import UIKit

public extension UITableView {
    
    /// Returns a Generic UITableViewCell
    /// - Parameters:
    ///   - identifier: UITableViewCells Identifier
    ///   - indexPath: IndexPath of the Cell
    ///   - type: Generic Type
    /// - Returns: Generic<T> UITableViewCell
    func dequeueReusableCell<T>(withIdentifier identifier: String, for indexPath: IndexPath, as type: T.Type) -> T {
        return GenericCasting.forceCast(dequeueReusableCell(withIdentifier: identifier, for: indexPath), to: type)
    }
}
