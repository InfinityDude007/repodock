//
//  Settings.swift
//  RepoDock
//
//  Created by Armaan Jhanji on 09/01/2026.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Settings")
                .font(.title2)
                .fontWeight(.semibold)

            Divider()

            Text("RepoDock settings will live here.")
                .foregroundStyle(.text)

            Spacer()
        }
        .padding(20)
        .frame(minWidth: 800, minHeight: 500)
        .background(.bg)
        .toolbarBackground(.secondaryBg)
    }
}

#Preview {
    SettingsView()
}
