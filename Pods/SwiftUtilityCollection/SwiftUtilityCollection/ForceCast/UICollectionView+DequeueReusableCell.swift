//
//  UICollectionView+DequeueReusableCell.swift
//  SwiftUtilityCollection
//
//  Created by Bortas, Flavius on 2/1/21.
//  Copyright © 2021 Johnston, Amelia. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    /// Returns a Generic CollectionViewCell
    /// - Parameters:
    ///   - identifier: UICollectionViewCell Identifier
    ///   - indexPath: Index Path of the Cell
    ///   - type: Generic Type
    /// - Returns: Generic<T> CollectionViewCell
    func dequeueReusableCell<T>(withIdentifier identifier: String, for indexPath: IndexPath, as type: T.Type) -> T {
        return GenericCasting.forceCast(dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath), to: type)
    }
}
