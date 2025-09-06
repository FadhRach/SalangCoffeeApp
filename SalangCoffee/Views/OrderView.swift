//
//  OrderView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel = CoffeeViewModel()
    @State private var cartItems: [CartItem] = []
    @State private var showingCheckout = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Coffee Menu
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.coffees) { coffee in
                            VStack {
                                Text("☕")
                                    .font(.system(size: 40))
                                    .padding()
                                    .background(Color.brown.opacity(0.1))
                                    .cornerRadius(15)
                                
                                Text(coffee.name)
                                    .font(.headline)
                                    .foregroundColor(.brown)
                                
                                Text(coffee.price)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Button("+ Tambah") {
                                    addToCart(coffee)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.brown)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                // Cart Header
                if !cartItems.isEmpty {
                    HStack {
                        Text("Keranjang Belanja")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.brown)
                        
                        Spacer()
                        
                        Text("\(cartItems.count) item")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                
                // Cart Items or Empty State
                if cartItems.isEmpty {
                    VStack {
                        Spacer()
                        
                        Text("☕")
                            .font(.system(size: 80))
                            .opacity(0.5)
                        
                        Text("Keranjang Kosong")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.brown)
                        
                        Text("Pilih kopi favorit Anda dari menu di atas")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(cartItems) { item in
                                HStack {
                                    Text("☕")
                                        .font(.system(size: 24))
                                        .padding()
                                        .background(Color.brown.opacity(0.1))
                                        .cornerRadius(12)
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.coffee.name)
                                            .font(.headline)
                                            .foregroundColor(.brown)
                                        
                                        Text(item.coffee.price)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        HStack {
                                            Button("-") {
                                                updateQuantity(for: item, quantity: item.quantity - 1)
                                            }
                                            .font(.title2)
                                            .foregroundColor(.brown)
                                            
                                            Text("\(item.quantity)")
                                                .font(.headline)
                                                .foregroundColor(.brown)
                                            
                                            Button("+") {
                                                updateQuantity(for: item, quantity: item.quantity + 1)
                                            }
                                            .font(.title2)
                                            .foregroundColor(.brown)
                                        }
                                        
                                        Button("Hapus") {
                                            removeFromCart(item)
                                        }
                                        .font(.caption)
                                        .foregroundColor(.red)
                                    }
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(16)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    // Checkout Button
                    VStack {
                        HStack {
                            Text("Total Pembayaran")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.brown)
                            
                            Spacer()
                            
                            Text("Rp \(getTotalPrice())")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.brown)
                        }
                        .padding(.horizontal, 20)
                        
                        Button("Pesan Sekarang") {
                            showingCheckout = true
                        }
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(16)
                        .padding(.horizontal, 20)
                    }
                    .background(Color.white)
                }
            }
            .background(Color(.systemGray6))
            .navigationTitle("Pesanan")
        }
        .alert("Pesanan Berhasil!", isPresented: $showingCheckout) {
            Button("OK") {
                cartItems.removeAll()
            }
        } message: {
            Text("Terima kasih! Pesanan Anda sedang diproses.")
        }
    }
    
    func addToCart(_ coffee: Coffee) {
        if let existingIndex = cartItems.firstIndex(where: { $0.coffee.id == coffee.id }) {
            cartItems[existingIndex].quantity += 1
        } else {
            cartItems.append(CartItem(coffee: coffee, quantity: 1))
        }
    }
    
    func updateQuantity(for item: CartItem, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            if quantity > 0 {
                cartItems[index].quantity = quantity
            } else {
                cartItems.remove(at: index)
            }
        }
    }
    
    func removeFromCart(_ item: CartItem) {
        cartItems.removeAll { $0.id == item.id }
    }
    
    func getTotalPrice() -> String {
        let total = cartItems.reduce(0) { sum, item in
            let price = Int(item.coffee.price.replacingOccurrences(of: "Rp ", with: "").replacingOccurrences(of: ".", with: "")) ?? 0
            return sum + (price * item.quantity)
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter.string(from: NSNumber(value: total)) ?? "\(total)"
    }
}

struct CartItem: Identifiable {
    let id = UUID()
    let coffee: Coffee
    var quantity: Int
}
