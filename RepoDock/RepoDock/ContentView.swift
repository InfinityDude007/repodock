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
    @State private var repositories: [Repository] = []

    private let repoScanner = RepositoryScanner()
    
    // MARK: - View
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
            
            // Show repository list
            if !repositories.isEmpty {
                Divider()

                List(repositories) { repo in
                    VStack(alignment: .leading) {
                        Text(repo.name)
                            .font(.headline)

                        Text(repo.path)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding(20)
        .frame(minWidth: 800, minHeight: 500)
    }
    
    // MARK: - Button action
    
    /// Opens a the native folder picker and scans the selected directory
    private func selectFolder() {
        let panel = NSOpenPanel()
        panel.title = "Select a folder to scan"
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false

        if panel.runModal() == .OK, let url = panel.url {
            selectedFolderPath = url.path
            
            // Run filesystem scanning off the main thread
            DispatchQueue.global(qos: .userInitiated).async {
                let foundRepos = repoScanner.scanRepositories(forRepositoriesIn: url)
                
                // Update UI state on the main thread
                DispatchQueue.main.async {
                    repositories = foundRepos
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
