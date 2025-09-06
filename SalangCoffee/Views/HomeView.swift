//
//  HomeView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = CoffeeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header Section
                    headerSection
                    
                    // Promotional Banner
                    promotionalBanner
                    
                    // Coffee Categories
                    categoriesSection
                    
                    // Featured Coffee Carousel
                    featuredCoffeeSection
                    
                    // Popular Coffee Grid
                    popularCoffeeSection
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
            .background(Color(.systemGray6))
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Selamat Datang!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Salang Coffee")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
            }
            
            Spacer()
            
            // Profile Button
            Button(action: {}) {
                Image(systemName: "person.circle.fill")
                    .font(.title2)
                    .foregroundColor(.brown)
            }
        }
        .padding(.top)
    }
    
    // MARK: - Promotional Banner
    private var promotionalBanner: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.brown, Color.orange]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .frame(height: 120)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Promo Hari Ini!")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Diskon 20% untuk semua minuman kopi")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                    
                    Button("Pesan Sekarang") {
                        // Action
                    }
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.brown)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                
                Spacer()
                
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding()
        }
    }
    
    // MARK: - Categories Section
    private var categoriesSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Kategori")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.brown)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    CategoryItem(icon: "cup.and.saucer", title: "Espresso", isSelected: true)
                    CategoryItem(icon: "drop.fill", title: "Cold Brew", isSelected: false)
                    CategoryItem(icon: "leaf.fill", title: "Frappé", isSelected: false)
                    CategoryItem(icon: "heart.fill", title: "Signature", isSelected: false)
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Featured Coffee Carousel
    private var featuredCoffeeSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Kopi Unggulan")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.brown)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.coffees) { coffee in
                        CoffeeCarouselCard(coffee: coffee)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Popular Coffee Section
    private var popularCoffeeSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Menu Populer")
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
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15) {
                ForEach(viewModel.coffees) { coffee in
                    CoffeeView(coffee: coffee)
                }
            }
        }
    }
}

// MARK: - Supporting Views
struct CategoryItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(isSelected ? .white : .brown)
                .frame(width: 50, height: 50)
                .background(isSelected ? Color.brown : Color.white)
                .cornerRadius(25)
                .shadow(radius: 2)
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .brown : .gray)
        }
    }
}

struct CoffeeCarouselCard: View {
    let coffee: Coffee
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Coffee Image
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 120)
                
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.brown.opacity(0.6))
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(coffee.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(coffee.price)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Tambah")
                    }
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.brown)
                    .cornerRadius(20)
                }
            }
            .padding(.horizontal, 12)
        }
        .frame(width: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 4)
    }
}

#Preview {
    HomeView()
}
