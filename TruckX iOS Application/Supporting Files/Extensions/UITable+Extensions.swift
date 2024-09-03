//
//  UITable+Extensions.swift
//  TruckX iOS Application
//
//  Created by Owais on 19/08/24.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type, withIdentifier identifier: String)
    {
        let nibName = String(describing: cellType)
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Error dequeuing cell for identifier \(identifier)")
        }
        return cell
    }
}
