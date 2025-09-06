//
//  ProfileView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var isEditingProfile = false
    
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
                VStack(spacing: 24) {
                    // Profile Header
                    profileHeader
                    
                    // Menu Items
                    menuSection
                    
                    // Logout Button
                    logoutButton
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
        }
    }
    
    private var profileHeader: some View {
        VStack(spacing: 16) {
            // Profile Image
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
            }
            .shadow(color: .green.opacity(0.3), radius: 8, x: 0, y: 4)
            
            // Profile Info
            VStack(spacing: 6) {
                Text("Fadhlan Nur R")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("+62 895 331 580 867")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Button("Edit Profil") {
                    isEditingProfile = true
                }
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.green)
                .padding(.top, 4)
            }
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 2)
    }
    
    private var menuSection: some View {
        VStack(spacing: 0) {
            ForEach(Array(menuItems.enumerated()), id: \.element.id) { index, item in
                MenuRow(item: item, isLast: index == menuItems.count - 1)
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 2)
    }
    
    private var logoutButton: some View {
        Button(action: {
            // Logout action
        }) {
            HStack {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 16, weight: .medium))
                
                Text("Keluar")
                    .font(.body)
                    .fontWeight(.medium)
            }
            .foregroundColor(.red)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 2)
        }
        .padding(.top, 8)
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
    
    var body: some View {
        Button(action: {
            // Handle menu item tap
        }) {
            HStack(spacing: 16) {
                Image(systemName: item.icon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.green)
                    .frame(width: 24, height: 24)
                
                Text(item.title)
                    .font(.body)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .buttonStyle(PlainButtonStyle())
        
        if !isLast {
            Divider()
                .padding(.leading, 60)
        }
    }
}

#Preview {
    ProfileView()
}
