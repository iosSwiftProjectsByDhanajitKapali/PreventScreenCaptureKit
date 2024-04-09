//
//  UIView+PreventScreenCapture.swift
//  PreventScreenCapture
//
//  Created by Dhanajit Kapali on 01/03/23.
//

import UIKit.UIView

@objc extension UIView {
    func preventScreenshot(for view: UIView) {
        if true  {
            let textField = UITextField(frame: view.bounds)
            textField.isSecureTextEntry = true
            textField.isUserInteractionEnabled = false
            guard let hiddenView = textField.layer.sublayers?.first?.delegate as? UIView else {
                return
            }
            hiddenView.subviews.forEach { $0.removeFromSuperview() }
            self.addSubview(hiddenView)
            hiddenView.addSubview(view)
        }
    }
}
