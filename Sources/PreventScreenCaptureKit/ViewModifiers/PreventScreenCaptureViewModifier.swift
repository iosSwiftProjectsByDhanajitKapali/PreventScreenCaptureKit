//
//  PreventScreenshotViewModifier.swift
//  PreventScreenCapture
//
//  Created by Dhanajit Kapali on 01/03/23.
//

import SwiftUI

public struct PreventScreenCaptureViewModifier: ViewModifier {
    @available(iOS 13.0.0, *)
    public func body(content: Content) -> some View {
        GeometryReader { reader in
            PreventScreenCaptureView(frame: .init(x: 0, y: 0, width: reader.size.width, height: reader.size.height)) {
                content
            }
        }
    }
}
