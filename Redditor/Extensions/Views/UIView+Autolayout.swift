//
//  UIView+Autolayout.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

extension UIView {
    
    func prepareForAutolayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func centerToSuperview(usingSafeLayout: Bool = false) {
        guard let superview = superview else {
            assertionFailure("A 'superview' is need to implement autolayout. View: \(String(describing: self))")
            return
        }
        
        prepareForAutolayout()
        
        if usingSafeLayout {
            centerYAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.centerYAnchor).isActive = true
            centerXAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.centerXAnchor).isActive = true
        } else {
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        }
    }
}
