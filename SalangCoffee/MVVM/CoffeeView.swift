//
//  CoffeeView.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import SwiftUI

struct CoffeeView: View {
    let coffee: Coffee
    
    var body: some View {
        VStack {
            Image(coffee.image)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .cornerRadius(15)
            
            Text(coffee.name)
                .font(.headline)
                .padding(.top, 5)
            
            Text(coffee.price)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 150, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 4)
    }
}
