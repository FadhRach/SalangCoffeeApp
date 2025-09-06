//
//  ContentView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView().tabItem { Label("Home", systemImage: "cup.and.saucer.fill") }.tag(1)
            OrderView().tabItem { Label("Order", systemImage: "list.clipboard.fill") }.tag(2)
            ProfileView().tabItem { Label("Profile", systemImage: "person.crop.circle.fill") }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
