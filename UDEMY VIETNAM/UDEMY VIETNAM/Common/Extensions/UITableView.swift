//
//  UITableView.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: BaseTableViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
            
        }
        
        return cell
        
    }

    func dequeueReusableHeaderFooterView<T: BaseTableHeaderFooterView>() -> T {
        
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header/footer with identifier \(T.reuseIdentifier)")
        }
        
        return headerFooter
        
    }

}
