//
//  View+PreventScreenCapture.swift
//  PreventScreenCapture
//
//  Created by Dhanajit Kapali on 01/03/23.
//

import SwiftUI

public extension View {
    func preventScreenCapture() -> some View {
        self.modifier(PreventScreenCaptureViewModifier())
    }
}

