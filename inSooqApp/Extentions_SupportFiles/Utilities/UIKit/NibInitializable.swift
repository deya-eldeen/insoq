//
//  NibInitializable.swift
//  orood
//
//  Created by Deya AlDeen on 15/07/2021.
//

import UIKit

protocol NibInitializable {
    static var nibIdentifier: String { get }
}

extension NibInitializable where Self: UIViewController {
    
    static var nibIdentifier: String {
        return String(describing: Self.self)
    }
    
    static func initFromXib() -> Self{
        return Self(nibName: nibIdentifier, bundle: nil)
    }
}

extension UIView {
    
    static func instanceFromNib(nibIdentifier: String) -> Self {
        return UINib(nibName: nibIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as! Self
    }
    
}
