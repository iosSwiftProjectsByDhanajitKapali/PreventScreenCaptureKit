//
//  PreventScreenshotView.swift
//  PreventScreenCapture
//
//  Created by Dhanajit Kapali on 01/03/23.
//

import SwiftUI


/// Wraps the swiftUI view into a UIKit's View and then then wraps into a UITextField
@available(iOS 13.0, *)
public struct PreventScreenCaptureView<Content: View>: UIViewRepresentable {
    private let content: UIView

    init(frame: CGRect, @ViewBuilder content: () -> Content) {
        self.content = UIHostingController(rootView: content()).view
        self.content.frame = frame
        self.content.backgroundColor = .clear
    }
    
    public func makeUIView(context: Context) -> UIView {
        let preventableScrenshotView = UIView()
        preventableScrenshotView.addSubview(content)
        preventableScrenshotView.preventScreenshot(for: content)
        return preventableScrenshotView
    }

    public func updateUIView(_ uiView: UIView, context: Context) { }
}
