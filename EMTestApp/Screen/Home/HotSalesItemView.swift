//
//  HotSalesItemView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 07.09.2022.
//

import SwiftUI

struct HotSalesItemView: View {
    
    var model: HomeStore
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                AsyncImage(url: URL(string: model.picture), content: { image in
                    image.resizable()
                        .scaleEffect(1.8, anchor: .topTrailing)
                        .frame(width: geometry.size.width, height: 180)
                        .cornerRadius(10)
                        .overlay {
                            VStack {
                                if model.isNew ?? false {
                                    Circle()
                                        .fill(Color.ecColor(.orange))
                                        .overlay(
                                            Text("New")
                                                .font(Font.markpro(.bold, size: 10))
                                                .foregroundColor(.white)
                                        )
                                        .frame(width: 27, height: 27, alignment: .topTrailing)
                                        .padding(.leading, 280)
                                        .padding(.bottom, 20)
                                        
                                }
                                Text(model.title)
                                        .font(Font.markpro(.bold, size: 25))
                                        .foregroundColor(.white)
                                        .padding(.leading, 200)
                                
                                Text(model.subtitle)
                                    .foregroundColor(.white)
                                    .font(Font.markpro(.regular, size: 11))
                                    .padding(.leading, 200)
                                
                                
                                Button(action: {}) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.white)
                                        .overlay {
                                            Text("Buy now!")
                                                .font(Font.markpro(.bold, size: 11))
                                                .foregroundColor(.black)
                                        }
                                }
                                .frame(width: 98, height: 23)
                                .padding(.leading, 200)
                                .padding(.top, 10)
                            }
                        }
                }, placeholder: {
                    HStack(alignment: .center) {
                        ProgressView()
                            .frame(width: geometry.size.width / 2 + 10, height: 182, alignment: .trailing)
                    }
                })
            }
            
        }
    }
}

struct HotSalesItemView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesItemView(model: HomeStore(id: 1, isNew: true, title: "iPhone 12", subtitle: "Súper. Mega. Rápido.", picture: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both", isBuy: true))
    }
}
