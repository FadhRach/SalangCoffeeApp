//
//  ProfileView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI


struct CoffeeColorPalette {
    let darkBrown = Color(red: 0.35, green: 0.25, blue: 0.15)      // #59402E
    let mediumBrown = Color(red: 0.51, green: 0.35, blue: 0.24)    // #82593C
    let lightBrown = Color(red: 0.67, green: 0.55, blue: 0.45)     // #AB8D72
    let cream = Color(red: 0.96, green: 0.94, blue: 0.89)          // #F5F0E3
    let coffee = Color(red: 0.27, green: 0.18, blue: 0.12)         // #452E1E
    let background = Color(red: 0.98, green: 0.96, blue: 0.93)     // #FAF5ED
    let cardBackground = Color(red: 0.99, green: 0.97, blue: 0.95) // #FCFAF2
}

struct ProfileView: View {
    @State private var isEditingProfile = false
    
    // Coffee Brown Color Palette
    private let coffeeColors = CoffeeColorPalette()
    
    private let menuItems = [
        MenuItem(icon: "location", title: "Alamat Tersimpan"),
        MenuItem(icon: "creditcard", title: "Pembayaran"),
        MenuItem(icon: "questionmark.circle", title: "Pusat Bantuan"),
        MenuItem(icon: "gearshape", title: "Pengaturan"),
        MenuItem(icon: "doc.text", title: "Syarat dan Ketentuan"),
        MenuItem(icon: "shield", title: "Kebijakan Privasi"),
        MenuItem(icon: "globe", title: "Media Sosial")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 28) {
                    // Profile Header
                    profileHeader
                    
                    // Menu Items
                    menuSection
                    
                    // Logout Button
                    logoutButton
                    
                    // Bottom spacer for TabView
                    Spacer()
                        .frame(height: 120)
                }
                .padding(.horizontal, 22)
                .padding(.top, 12)
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.large)
            .background(coffeeColors.background)
        }
    }
    
    private var profileHeader: some View {
        VStack(spacing: 18) {
            // Profile Image
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [coffeeColors.mediumBrown, coffeeColors.darkBrown]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 85, height: 85)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 34, weight: .medium))
                    .foregroundColor(coffeeColors.cream)
            }
            .shadow(color: coffeeColors.darkBrown.opacity(0.3), radius: 12, x: 0, y: 6)
            
            // Profile Info
            VStack(spacing: 8) {
                Text("Fadhlan Nur R")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(coffeeColors.coffee)
                
                Text("+62 895 331 580 867")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(coffeeColors.mediumBrown)
                
                Button("Edit Profil") {
                    isEditingProfile = true
                }
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(coffeeColors.darkBrown)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(coffeeColors.lightBrown.opacity(0.3))
                .cornerRadius(20)
                .padding(.top, 6)
            }
        }
        .padding(.vertical, 25)
        .frame(maxWidth: .infinity)
        .background(coffeeColors.cardBackground)
        .cornerRadius(20)
        .shadow(color: coffeeColors.darkBrown.opacity(0.1), radius: 15, x: 0, y: 3)
    }
    
    private var menuSection: some View {
        VStack(spacing: 0) {
            ForEach(Array(menuItems.enumerated()), id: \.element.id) { index, item in
                MenuRow(item: item, isLast: index == menuItems.count - 1, coffeeColors: coffeeColors)
            }
        }
        .background(coffeeColors.cardBackground)
        .cornerRadius(20)
        .shadow(color: coffeeColors.darkBrown.opacity(0.1), radius: 15, x: 0, y: 3)
    }
    
    private var logoutButton: some View {
        Button(action: {
            // Logout action
        }) {
            HStack(spacing: 12) {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Keluar")
                    .font(.body)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.red.opacity(0.8), Color.red]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(20)
            .shadow(color: Color.red.opacity(0.3), radius: 12, x: 0, y: 4)
        }
        .padding(.top, 12)
    }
}

struct MenuItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
}

struct MenuRow: View {
    let item: MenuItem
    let isLast: Bool
    let coffeeColors: CoffeeColorPalette
    
    var body: some View {
        Button(action: {
            // Handle menu item tap
        }) {
            HStack(spacing: 18) {
                Image(systemName: item.icon)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(coffeeColors.darkBrown)
                    .frame(width: 28, height: 28)
                
                Text(item.title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(coffeeColors.coffee)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(coffeeColors.mediumBrown)
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 18)
        }
        .buttonStyle(PlainButtonStyle())
        
        if !isLast {
            Divider()
                .background(coffeeColors.lightBrown.opacity(0.3))
                .padding(.leading, 68)
        }
    }
}

#Preview {
    ProfileView()
}
