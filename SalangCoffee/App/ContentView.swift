//
//  ContentView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        // Coffee theme TabBar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.99, green: 0.97, blue: 0.95, alpha: 1.0) // Coffee cream background
        
        // Selected tab color (coffee brown)
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(red: 0.27, green: 0.18, blue: 0.12, alpha: 1.0)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.27, green: 0.18, blue: 0.12, alpha: 1.0),
            .font: UIFont.systemFont(ofSize: 11, weight: .semibold)
        ]
        
        // Unselected tab color (medium brown)
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(red: 0.51, green: 0.35, blue: 0.24, alpha: 0.6)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.51, green: 0.35, blue: 0.24, alpha: 0.6),
            .font: UIFont.systemFont(ofSize: 11, weight: .medium)
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { 
                    Label("Home", systemImage: "cup.and.saucer.fill") 
                }
                .tag(1)
            
            OrderView()
                .tabItem { 
                    Label("Order", systemImage: "list.clipboard.fill") 
                }
                .tag(2)
            
            ProfileView()
                .tabItem { 
                    Label("Profile", systemImage: "person.crop.circle.fill") 
                }
                .tag(3)
        }
        .accentColor(Color(red: 0.27, green: 0.18, blue: 0.12)) // Coffee brown accent
    }
}

#Preview {
    ContentView()
}
