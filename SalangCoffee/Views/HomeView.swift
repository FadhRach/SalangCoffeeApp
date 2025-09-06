//
//  HomeView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = CoffeeViewModel()
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Header Section
                headerSection
                
                // Big Image Section
                bigImageSection
                
                // Coffee Carousel
                carouselSection
                
                // Fillable Boxes Grid
                fillableBoxesSection
                
                Spacer(minLength: 50)
            }
            .padding()
        }
        .background(Color(.systemGray6))
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 15) {
            // Top Header
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Hej, Salange Caffeiners")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Salang Coffee")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                }
                
                Spacer()
                
                // Notification & Profile
                HStack(spacing: 15) {
                    Button(action: {}) {
                        Image(systemName: "bell")
                            .font(.title3)
                            .foregroundColor(.brown)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "person.circle.fill")
                            .font(.title2)
                            .foregroundColor(.brown)
                    }
                }
            }
            
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Cari kopi favoritmu...", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 2)
        }
    }
    
    // MARK: - Big Image Section
    private var bigImageSection: some View {
        ZStack {
            // Background Image Placeholder
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.brown.opacity(0.8), Color.orange.opacity(0.6)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 180)
            
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Promo Spesial! ☕")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Beli 2 Gratis 1\nUntuk semua menu")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.leading)
                    
                    Button("Pesan Sekarang") {
                        // Action
                    }
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                
                Spacer()
                
                // Coffee Image
                Text("☕")
                    .font(.system(size: 80))
                    .opacity(0.7)
            }
            .padding()
        }
    }
    
    // MARK: - Carousel Section
    private var carouselSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Menu Favorit")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                
                Spacer()
                
                Button("Lihat Semua") {
                    // Action
                }
                .font(.subheadline)
                .foregroundColor(.brown)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.coffees) { coffee in
                        CoffeeCarouselCard(coffee: coffee)
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
    
    // MARK: - Fillable Boxes Section
    private var fillableBoxesSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Kategori Kopi")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.brown)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15) {
                FillableBox(title: "Hot Coffee", icon: "🔥", color: .red)
                FillableBox(title: "Cold Coffee", icon: "🧊", color: .blue)
                FillableBox(title: "Dessert", icon: "🍰", color: .pink)
                FillableBox(title: "Snacks", icon: "🍪", color: .orange)
            }
        }
    }
}

// MARK: - Coffee Carousel Card
struct CoffeeCarouselCard: View {
    let coffee: Coffee
    
    var body: some View {
        VStack(spacing: 12) {
            // Coffee Image
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.brown.opacity(0.1))
                .frame(width: 140, height: 100)
                .overlay(
                    Text("☕")
                        .font(.system(size: 50))
                )
            
            VStack(spacing: 6) {
                Text(coffee.name)
                    .font(.headline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                
                Text(coffee.price)
                    .font(.subheadline)
                    .foregroundColor(.brown)
                    .fontWeight(.bold)
                
                Button("+ Pesan") {
                    // Action
                }
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(Color.brown)
                .cornerRadius(15)
            }
        }
        .frame(width: 140)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}

// MARK: - Fillable Box
struct FillableBox: View {
    let title: String
    let icon: String
    let color: Color
    @State private var isSelected = false
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            VStack(spacing: 12) {
                Text(icon)
                    .font(.system(size: 40))
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Text("Tap to select")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .background(
                isSelected ? color.opacity(0.2) : Color.white
            )
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        isSelected ? color : Color.clear,
                        lineWidth: 2
                    )
            )
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.1), radius: 3)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    HomeView()
}
