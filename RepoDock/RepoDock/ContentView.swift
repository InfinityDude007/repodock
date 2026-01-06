//
//  ContentView.swift
//  RepoDock
//
//  Created by Armaan Jhanji on 06/01/2026.
//

import SwiftUI
import AppKit

struct ContentView: View {
    
    // MARK: - View state
    @State private var selectedFolderPath: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            // Title
            VStack(alignment: .leading, spacing: 4) {
                Text("RepoDock")
                    .font(.largeTitle)
                    .bold()

                Text("Local Git repository manager")
                    .foregroundStyle(.secondary)
            }

            Divider()

            // Button action
            Button("Select Folder") {
                selectFolder()
            }

            // Show selected path
            if !selectedFolderPath.isEmpty {
                Text("Selected folder:")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(selectedFolderPath)
                    .font(.system(.body, design: .monospaced))
            }

            Spacer()
        }
        .padding(20)
        .frame(minWidth: 800, minHeight: 500)
    }
    
    // MARK: - Button action
    private func selectFolder() {
        let panel = NSOpenPanel()
        panel.title = "Select a folder to scan"
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false

        if panel.runModal() == .OK, let url = panel.url {
            selectedFolderPath = url.path
        }
    }
}

#Preview {
    ContentView()
}
