//
//  CartView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 04.09.2022.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.dismiss) var dismiss
    var model: CartModel
    
    var body: some View {
        VStack {
            CartTopView()
            HStack {
                Text("My Cart")
                    .font(Font.markpro(.bold, size: 35))
                    .padding(.horizontal, 31)
                Spacer()
            }.padding(.top, 30)
            Spacer()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.ecColor(.blue))
                .ignoresSafeArea(.all, edges: .bottom)
                .frame(height: 580)
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 0)
                .overlay {
                    VStack {
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(model.basket.indices, id: \.self) { index in
                                    
                                    CartViewItem(model: model.basket[index])
                                        .padding(.vertical)
                                }
                            }
                        }
                        VStack(spacing: 20) {
                            Divider()
                                .frame(width: 400, height: 2)
                                .background(.white.opacity(0.25))
                            HStack {
                                Text("Total")
                                    .font(Font.markpro(.regular, size: 15))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("$\(model.total) us")
                                    .font(Font.markpro(.bold, size: 15))
                                    .foregroundColor(.white)
                                    .frame(width: 100, alignment: .leading)
                            }.padding(.horizontal, 20)
                            HStack {
                                Text("Delivery")
                                    .font(Font.markpro(.regular, size: 15))
                                    .foregroundColor(.white)
                                Spacer()
                                Text(model.delivery)
                                    .font(Font.markpro(.bold, size: 15))
                                    .foregroundColor(.white)
                                    .frame(width: 100, alignment: .leading)
                            }.padding(.horizontal, 20)
                            Divider()
                                .frame(width: 400, height: 1)
                                .background(.white.opacity(0.2))
                            Button(action: {}) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.ecColor(.orange))
                                    .frame(width: 326, height: 54)
                                    .overlay {
                                        Text("Chekout")
                                            .font(Font.markpro(.bold, size: 20))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.top, 10)
                            }
                        }
                    }
                    .padding(.top, 30)
                }
        }.background(Color.ecColor(.gray))
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(model: CartModel(basket: [Basket(id: 1, images: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg", price: 1500, title: "Galaxy Note 20 Ultra"), Basket(id: 1, images: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-silver-select?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1631652954000", price: 1500, title: "Galaxy Note 20 Ultra")], delivery: "Free", id: "", total: 6000))
    }
}

