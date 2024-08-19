//
//  UITable+Extensions.swift
//  TruckX iOS Application
//
//  Created by Owais on 19/08/24.
//

import UIKit

//extension UITableView {
//
//    func register<T: UITableViewCell>(cellType: T.Type) {
//        let nibName = String(describing: cellType)
//        let identifier = String(describing: cellType)
//        let nib = UINib(nibName: nibName, bundle: nil)
//        self.register(nib, forCellReuseIdentifier: identifier)
//    }
//
//    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
//        let identifier = String(describing: T.self)
//        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
//            fatalError("Error dequeuing cell for identifier \(identifier)")
//        }
//        return cell
//    }
//}
//
//struct CellIdentifiers {
//    static let firstCell = "FirstCell"
//    static let secondCell = "SecondCell"
//    static let thirdCell = "ThirdCell"
//}


extension UITableView {

    // Register a UITableViewCell with a nib using a custom identifier
    func register<T: UITableViewCell>(cellType: T.Type, withIdentifier identifier: String) {
        let nibName = String(describing: cellType)
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }

    // Dequeue a reusable UITableViewCell with a custom identifier
    func dequeueReusableCell<T: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Error dequeuing cell for identifier \(identifier)")
        }
        return cell
    }
}
