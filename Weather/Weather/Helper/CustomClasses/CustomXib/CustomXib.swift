//
//  CustomXib.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit

/// Optional protocol for the ReusableView class.
protocol ReusableView: class {}

/// It is an extension of ReusableView class.
extension ReusableView where Self: UIView {
    /// reuseIdentifier used to store identifier of the UI controls.
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

/// Optional protocol for the NibLoadableView class.
protocol NibLoadableView: class { }

/// It is an extension of NibLoadableView class.
extension NibLoadableView where Self: UIView {
    // MARK: Variables
    /// NibName used to store name of the nib files.
    static var NibName: String {
        return String(describing: self)
    }
}

/// It is an extension of UITableView class.
extension UITableView {
    /// It's used to register `UITableViewCell`.
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    /// It's used to register `UITableViewHeaderFooterView`.
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
}

/// It is an extension of UICollectionView class.
extension UICollectionView {
    /// It's used to register `UICollectionViewCell`.
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}
