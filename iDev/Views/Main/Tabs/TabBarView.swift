//
//  TabBarView.swift
//  iDev
//
//  Created by Bek Roz on 8.04.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ServicesView()
                .tabItem {
                    Label("Services", systemImage: "circle.hexagongrid.circle.fill")
                }
            TerminalView()
                .tabItem {
                    Label("Terminal", systemImage: "text.and.command.macwindow")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style:
                    .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.primary.opacity(0.2))
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    TabBarView()
}
