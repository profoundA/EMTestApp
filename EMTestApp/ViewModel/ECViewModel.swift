//
//  ECViewModel.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 07.09.2022.
//

import Foundation
import SwiftUI

@MainActor
class ECViewModel: ObservableObject {
    
    let service: NetworkService
    
    @Published var homeStore = [HomeStore]()
    @Published var bestSeller = [BestSeller]()
    @Published var cart: CartModel!
    @Published var basket = [Basket]()
    @Published var details: DetailModel!
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func getData() async {
        do {
            homeStore = try await service.fetchData().homeStore
            bestSeller = try await service.fetchData().bestSeller
            cart = try await service.fetchCartData()
            details = try await service.fetchDetailsData()
            basket = try await service.fetchCartData().basket
        } catch {
            print("error")
        }
    }
}
