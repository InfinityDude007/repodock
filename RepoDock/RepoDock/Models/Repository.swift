//
//  Repository.swift
//  RepoDock
//
//  Created by Armaan Jhanji on 06/01/2026.
//

import Foundation

/// Model for local Git repositories
struct Repository: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let path: String
}
