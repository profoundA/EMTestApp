//
//  BestSellerItemView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 07.09.2022.
//

import SwiftUI

struct BestSellerItemView: View {
    
    var model: BestSeller
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .frame(width: 181, height: 227)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                .overlay {
                    VStack {
                        AsyncImage(url: URL(string: model.picture)) { image in
                            image.resizable()
                                .frame(width: 168, height: 187)
                                .scaledToFit()
                                .overlay {
                                    Circle()
                                        .fill(.white)
                                        .overlay(
                                            Image(systemName: model.isFavorites ? "heart.fill":"heart")
                                                .renderingMode(.template)
                                                .foregroundColor(.red)
                                        )
                                        .frame(width: 26, height: 26)
                                        .padding(.bottom, 155)
                                        .padding(.leading, 125)
                                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 0)
                                    
                                }
                        
                                
                            
                        } placeholder: {
                            HStack {
                                Text("Loading")
                                    .font(Font.markpro(.medium, size: 15))
                                    .padding(.horizontal, 4)
                                ProgressView()
                            }
                        }
                        Text(model.title)
                            .font(Font.markpro(.regular, size: 10))
                            .offset(y: 1)
                            .padding(.top, -10)
                        HStack {
                            Text("$\(model.discountPrice)")
                                .font(Font.markpro(.bold, size: 16))
                            Text("$\(model.priceWithoutDiscount)")
                                .font(Font.markpro(.medium, size: 10))
                                .foregroundColor(Color.ecColor(.itemGray))
                                .strikethrough()
                        }
                    }
                    
                }
            
        }
    }
}

struct BestSellerItemView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerItemView(model: BestSeller(id: 0, isFavorites: true, title: "Title", priceWithoutDiscount: 1000, discountPrice: 800, picture: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg"))
            .previewLayout(.sizeThatFits)
    }
}
