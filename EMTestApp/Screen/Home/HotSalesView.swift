//
//  HotSalesView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 07.09.2022.
//

import SwiftUI

struct HotSalesView: View {
    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var model: [HomeStore]
    
    var body: some View {
        
        GeometryReader { view in
            ForEach(model.indices, id: \.self) { index in
                
                ZStack {
                    HotSalesItemView(model: model[index])
                }
                .frame(width: view.size.width, height: 182)
                
                
                .scaleEffect(1.0 - abs(distance(model[index].id - 1)) * 0.2 )
                .opacity(1.0 - abs(distance(model[index].id - 1))  )
                .offset(x:myXOffset(model[index].id - 1), y: 0)
                .zIndex(1.0 - abs(distance(model[index].id - 1)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 700
                }
                .onEnded { value in
                    withAnimation(.interpolatingSpring(mass: 0.3, stiffness: 150, damping: 10, initialVelocity: 0.3)) {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 750
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(model.count))
                        snappedItem = draggingItem
                    }
                }
        )
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(model.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(model.count) * distance(item)
        return sin(angle) * 200
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesView(model: [
            HomeStore(id: 1, isNew: true, title: "iPhone 12", subtitle: "Súper. Mega. Rápido.", picture: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both", isBuy: true),
            HomeStore(id: 2, isNew: false, title: "Xiaomi", subtitle: "Súper. Mega. Rápido.", picture: "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg", isBuy: true),
            HomeStore(id: 3, isNew: false, title: "Xiaomi", subtitle: "Súper. Mega. Rápido.", picture: "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg", isBuy: true)
        ])
    }
}
