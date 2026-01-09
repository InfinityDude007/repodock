//
//  ToolbarSettingsButton.swift
//  RepoDock
//
//  Created by Armaan Jhanji on 09/01/2026.
//

import SwiftUI

struct ToolbarSettingsButton: View {
    let systemImage: String
    let help: String

    @State private var isHovered = false

    var body: some View {
        SettingsLink {
            Image(systemName: systemImage)
                .foregroundStyle(isHovered ? .accent : .text)
        }
        .help(help)
        .onHover { hovering in
            withAnimation(.easeInOut(duration: 0.2)) {
                isHovered = hovering
            }
            if hovering {
                NSCursor.pointingHand.push()
            } else {
                NSCursor.pop()
            }
        }
    }
}
