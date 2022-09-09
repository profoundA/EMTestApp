//
//  TabBarView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 04.09.2022.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var viewModel: ECViewModel
    @State var isPresented: Bool = false
    
    var basket: [Basket]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.ecColor(.blue))
            .frame(width: 350, height: 60)
            .overlay {
                HStack(spacing: 40) {
                    Button(action: {}) {
                        Circle()
                            .fill(.white)
                            .frame(width: 8, height: 8)
                            .padding(.top, 2)
                        Text("Explorer")
                            .foregroundColor(.white)
                            .font(Font.markpro(.bold, size: 15))
                    }
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image("Cart")
                            .overlay {
                                Text("\(basket.count)")
                                    .font(Font.markpro(.bold, size: 11))
                                    .foregroundColor(.white)
                                    .offset(y: 1)
                            }
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        if let cart = viewModel.cart {
                        CartView(model: cart)
                        } else {
                            CartView(model: CartModel(basket: [Basket(id: 0, images: "", price: 0, title: "-")], delivery: "-", id: "-", total: 0))
                        }
                    }
                    Button(action: {}) {
                        Image("Favorites")
                    }
                    Button(action: {}) {
                        Image("Personal")
                    }
                }
            }
            .padding(.bottom)

    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(basket: [Basket(id: 0, images: "", price: 0, title: ""),
                           Basket(id: 1, images: "", price: 0, title: "")])
            .previewLayout(.sizeThatFits)
            .environmentObject(ECViewModel(service: NetworkService()))
    }
}
