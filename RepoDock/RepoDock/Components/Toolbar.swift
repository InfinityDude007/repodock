//
//  Toolbar.swift
//  RepoDock
//
//  Created by Armaan Jhanji on 08/01/2026.
//

import SwiftUI

struct RepoDockToolbar: ToolbarContent {
    var body: some ToolbarContent {
        
        // MARK: - App title
        ToolbarItem(placement: .automatic) {
            HStack(spacing: 0) {
                Text("Repo")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.text)

                Text("Dock")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundStyle(.accent)
            }
        }.sharedBackgroundVisibility(.hidden)
        
        ToolbarSpacer(.flexible)
        
        // MARK: - Toolbar button
        ToolbarItemGroup {
            
            /// Search repositories
            ToolbarIconButton(
                systemImage: "magnifyingglass",
                help: "Search Repositories"
            ) {
                // search logic
            }
            
            /// Create new folder
            ToolbarIconButton(
                systemImage: "folder.badge.plus",
                help: "Create New Folder"
            ) {
                // new folder logic
            }
            
            /// Clone new repository from GitHub
            ToolbarIconButton(
                systemImage: "point.topleft.filled.down.to.point.bottomright.curvepath",
                help: "Clone Repository"
            ) {
                // clone repo logic
            }
            
            /// Refresh repository list
            ToolbarIconButton(
                systemImage: "arrow.trianglehead.2.clockwise.rotate.90",
                help: "Refresh"
            ) {
                // refresh repos logic
            }
            
            /// Return to dashboard
            ToolbarIconButton(
                systemImage: "house",
                help: "Back to Dashboard"
            ) {
                // back to dashboard logic
            }
            
            /// Open Settings
            ToolbarSettingsButton(
                systemImage: "gearshape",
                help: "Open Settings"
            )
        }
    }
}
