//
//  VSCodeLauncher.swift
//  RepoDock
//
//  Created by Armaan Jhanji on 06/01/2026.
//

import Foundation
import AppKit

/// Used to launch the selected repository in VS Code
final class VSCodeLauncher {
    
    /// Opens given path  in VS Code
    func openRepository(at path: String) {
        let url = URL(fileURLWithPath: path)
        
        NSWorkspace.shared.open(
            [url],
            withApplicationAt: URL(fileURLWithPath: "/Applications/Visual Studio Code.app"),
            configuration: NSWorkspace.OpenConfiguration()
        )
    }
}
