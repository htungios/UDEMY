//
//  UICollectionView.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: BaseCollectionViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
        }
        
        return cell
        
    }
    
}
