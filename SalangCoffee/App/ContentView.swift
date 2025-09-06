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
        appearance.backgroundColor = UIColor.systemBackground
        
        // Selected tab color (brown)
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.brown
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.brown,
            .font: UIFont.systemFont(ofSize: 11, weight: .semibold)
        ]
        
        // Unselected tab color (gray)
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.gray,
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
        .accentColor(.brown)
        .padding(.bottom, 8)
    }
}

#Preview {
    ContentView()
}
