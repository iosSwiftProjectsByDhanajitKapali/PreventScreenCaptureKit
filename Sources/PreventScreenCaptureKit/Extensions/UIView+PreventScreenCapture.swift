//
//  UIView+PreventScreenCapture.swift
//  PreventScreenCapture
//
//  Created by Dhanajit Kapali on 01/03/23.
//

import UIKit

public extension UIView {
    
    func preventScreenCapture() {
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            self.addSubview(field)
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
}
