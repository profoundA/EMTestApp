//
//  CartModel.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 08.09.2022.
//

import Foundation

struct CartModel: Codable {
    let basket: [Basket]
    let delivery, id: String
    let total: Int
}

struct Basket: Codable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
