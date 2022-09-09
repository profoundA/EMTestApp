//
//  CartViewItem.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 08.09.2022.
//

import SwiftUI

struct CartViewItem: View {
    
    var model: Basket
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.images)) { image in
                image.resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 88, height: 88 , alignment: .center)
            } placeholder: {
                ProgressView()
                    .frame(width: 88, height: 88 , alignment: .center)
            }
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(Font.markpro(.medium, size: 20))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Text("$\(model.price).00")
                    .frame(width: 160, alignment: .leading)
                    .font(Font.markpro(.medium, size: 20))
                    .foregroundColor(Color.ecColor(.orange))
            }
            .padding(.trailing, 50)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.ecColor(.darkGray))
                .frame(width: 26, height: 68)
                .overlay {
                    VStack {
                        Button(action: {}) {
                            Text("–")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        Text("1")
                            .font(Font.markpro(.medium, size: 20))
                            .foregroundColor(.white)
                        Button(action: {}) {
                            Text("+")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 3)
                        }
                    }
                }
            Button(action: {}) {
                Image("Trash")
            }
        }
    }
}

struct CartViewItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CartViewItem(model: Basket(id: 1, images: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg", price: 1500, title: "Galaxy Note 20 Ultra"))
            CartViewItem(model: Basket(id: 1, images: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-silver-select?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1631652954000", price: 1800, title: "iPhone 13"))
        }.previewLayout(.sizeThatFits)
    }
}
