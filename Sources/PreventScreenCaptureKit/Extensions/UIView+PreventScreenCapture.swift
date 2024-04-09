//
//  UIView+PreventScreenCapture.swift
//  PreventScreenCapture
//
//  Created by Dhanajit Kapali on 01/03/23.
//

import UIKit.UIView

@objc extension UIView {
    func preventScreenshot() {
        let textField = UITextField(frame: self.bounds)
        textField.isSecureTextEntry = true
        textField.isUserInteractionEnabled = false
        guard let hiddenView = textField.layer.sublayers?.first?.delegate as? UIView else {
            return
        }
        hiddenView.subviews.forEach { $0.removeFromSuperview() }
        
        let content = self.copyContentToImageView() ?? UIImageView()
        
        self.subviews.forEach { $0.removeFromSuperview() }
        hiddenView.addSubview(content)
        self.addSubview(hiddenView)
    }
}

extension UIView {
    func copyContentToImageView() -> UIImageView? {
        // Render the content of the current view into an image
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        guard let renderedImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        
        // Create a new UIImageView with the rendered image
        let imageView = UIImageView(image: renderedImage)
        imageView.frame = bounds
        imageView.contentMode = .scaleToFill
        
        return imageView
    }
}

