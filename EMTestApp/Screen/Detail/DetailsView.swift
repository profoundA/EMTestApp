//
//  DetailsView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 08.09.2022.
//

import SwiftUI
import ACarousel

struct DetailsView: View {
    
    var model: DetailModel
    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State private var id = 2
    @State var selectedTab = categoryTabs[0]
    
    var body: some View {
        
        VStack {
            DetailsTopView()
            
            GeometryReader { reader in
                ACarousel(model.images.indices, id: \.self, spacing: reader.size.width * 0.26, headspace: 0, sidesScaling: 0.7, isWrap: false, autoScroll: .inactive, content: { index in
                    HStack {
                        DetailsItemView(image: model.images[index])
                    }
                })
                .frame(width: reader.size.width, height: reader.size.height)
                
            }
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(height: 400)
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 0)
                .overlay {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(model.title)
                                .frame(width: 300, alignment: .leading)
                                .font(Font.markpro(.medium, size: 24))
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.ecColor(.blue))
                                .frame(width: 37, height: 37)
                                .overlay {
                                    Image(systemName: model.isFavorites ? "heart.fill" : "heart")
                                        .renderingMode(.template)
                                        .foregroundColor(model.isFavorites ? .red : .white)
                                }
                        }.padding(.top)
                        StarsView(rating: Float(model.rating))
                            .frame(width: 350, alignment: .leading)
                        
                        DetailsCategoryView(selectedTab: $selectedTab)
                            .padding(.top)
                            
                            
                        HStack(spacing: 50) {
                            DetailsSpecView(image: "CPU", specs: model.cpu)
                            DetailsSpecView(image: "Camera", specs: model.camera)
                            DetailsSpecView(image: "RAM", specs: model.ssd)
                            DetailsSpecView(image: "SD", specs: model.sd)
                        }
                        .frame(height: 70)
                        .padding(.top, 21)
                        .padding(.horizontal, 35)

                        Text("Select color and capacity")
                            .font(Font.markpro(.medium, size: 16))
                            .padding(.top, 10)
                        HStack {
                            DetailsColorView(color: model.color, selectedColor: .constant(model.color[0]))
                                .padding(.horizontal, 10)
                            Spacer()
                                .frame(width: 90)
                            DetailsCapacityView(selectedCapacity: .constant(model.capacity[0]), capacity: model.capacity)
                        }
                        Button(action: {}) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.ecColor(.orange))
                                .frame(width: 355, height: 54, alignment: .center)
                                .overlay {
                                    HStack {
                                        Text("Add to Cart")
                                            .font(Font.markpro(.bold, size: 20))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        Spacer()
                                            .frame(width: 50)
                                        Text("$\(model.price)")
                                            .font(Font.markpro(.bold, size: 20))
                                            .foregroundColor(.white)
                                    }
                                }
                                .frame(width: 355, height: 54)
                        }
                    }
                    .padding(.bottom, 20)
                    .padding(.leading)
                }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.ecColor(.gray))
    }
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(model.images.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(1) * distance(item)
        return sin(angle) * 200
    }
}
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(model: DetailModel(cpu: "Exynos 990", camera: "120000", capacity: ["12", "24"], color: ["#772D03", "#010035"], id: "12", images: ["https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig", "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"], isFavorites: false, price: 1500, rating: 4.5, sd: "256 GB", ssd: "8 GB", title: "Galaxy Note 20 Ultra"))
    }
}
