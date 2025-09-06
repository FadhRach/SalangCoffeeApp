//
//  ProfileView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
                    
                    // Header
                    Text("Akun")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                    
                    // Profile Card
                    HStack {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: 28))
                                    .foregroundColor(.gray)
                            )
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("FADHLAN NUR R")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Text("+62895331580867")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    // Menu list
                    List {
                        Text("Alamat Tersimpan")
                        Text("Pembayaran")
                        Text("Pusat Bantuan")
                        Text("Pengaturan")
                        Text("Syarat dan Ketentuan")
                        Text("Kebijakan Privasi")
                        Text("Media Sosial")
                    }
                }

    }
}

#Preview {
    ProfileView()
}
