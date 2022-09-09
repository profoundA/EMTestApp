//
//  BestSellerView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 08.09.2022.
//

import SwiftUI

struct BestSellerView: View {
    
    var model: [BestSeller]
    
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 10, maximum: .infinity)),
        GridItem(.flexible(minimum: 10, maximum: .infinity))
    ]
    
    @State var isActive: Bool = false
    @EnvironmentObject var viewModel: ECViewModel
    
    var body: some View {
        
        ZStack {
            LazyVGrid(columns: columns) {
                ForEach(model.indices, id: \.self) { index in
                    BestSellerItemView(model: model[index])
                        .onTapGesture {
                            isActive.toggle()
                        }
                }
                .fullScreenCover(isPresented: $isActive) {
                    if let details = viewModel.details {
                        DetailsView(model: details)
                    }
                
                }
            }
        }
    
    }
}

struct BestSellerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BestSellerView(model: [
                BestSeller(id: 0, isFavorites: true, title: "Title", priceWithoutDiscount: 1000, discountPrice: 800, picture: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg"),
                BestSeller(id: 0, isFavorites: true, title: "Title", priceWithoutDiscount: 1000, discountPrice: 800, picture: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg")
            ])
        }
        .environmentObject(ECViewModel(service: NetworkService()))
    }
}
