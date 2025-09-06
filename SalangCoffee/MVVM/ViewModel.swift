//
//  ViewModel.swift
//  SalangCoffee
//
//  Created by FadhlanNurRach on 06/09/25.
//

import Foundation

class CoffeeViewModel: ObservableObject {
    @Published var coffees: [Coffee] = [
        Coffee(name: "Espresso", image: "coffee1", price: "Rp 20.000"),
        Coffee(name: "Latte", image: "coffee2", price: "Rp 25.000"),
        Coffee(name: "Cappuccino", image: "coffee3", price: "Rp 22.000"),
        Coffee(name: "Americano", image: "coffee4", price: "Rp 18.000"),
    ]
}
