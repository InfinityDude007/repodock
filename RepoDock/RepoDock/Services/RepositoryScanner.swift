//
//  RepositoryScanner.swift
//  RepoDock
//
//  Created by Armaan Jhanji on 06/01/2026.
//

import Foundation

/// Used to discover Git repositories on disk
final class RepositoryScanner {
    
    /// Recursively scans a directory for Git repositories
    func scanRepositories(forRepositoriesIn rootURL: URL) -> [Repository] {
        let fileManager = FileManager.default
        
        guard let repositoryEnumerator = fileManager.enumerator(
            at: rootURL,
            includingPropertiesForKeys: [.isDirectoryKey],
            options: [.skipsHiddenFiles],
            errorHandler: { url, error in
                print("RepositoryScanner: Encountered error at \(url): \(error)")
                return true
            }
        ) else {
            return []
        }
        
        var repositories: [Repository] = []
        
        // Traverse the directory tree
        for case let url as URL in repositoryEnumerator {
            let gitURL = url.appendingPathComponent(".git")
            
            var isDirectory: ObjCBool = false
            if fileManager.fileExists(atPath: gitURL.path, isDirectory: &isDirectory),
            isDirectory.boolValue {
                repositories.append(
                    Repository(
                        name: url.lastPathComponent,
                        path: url.path
                    )
                )
                
                // Skip scanning inside repositories once they are found
                repositoryEnumerator.skipDescendants()
            }
        }
        
        // Sort alphabetically for cleaner UI ordering
        return repositories.sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
}
