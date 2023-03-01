//
//  View+PreventScreenCapture.swift
//  PreventScreenCapture
//
//  Created by Dhanajit Kapali on 01/03/23.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
    func preventScreenCapture() -> some View {
        self.modifier(PreventScreenCaptureViewModifier())
    }
}

