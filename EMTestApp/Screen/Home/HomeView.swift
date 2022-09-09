//
//  HomeView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 26.08.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTab = scrollTabs[0]
    
    @State private var showAlert = false
    
    @EnvironmentObject var viewModel: ECViewModel
    
    var body: some View {
        
        VStack {
            ScrollView(showsIndicators: false) {
                LocationView()
                SectionView(name: "Select Category", buttonName: "view all")
                CategoryView(selectedTab: $selectedTab)
                SearchView()
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 10, trailing: 0))
                SectionView(name: "Hot Sales", buttonName: "see more")
                HotSalesView(model: viewModel.homeStore)
                    .frame(height: 182)
                    .padding(.horizontal)
                SectionView(name: "Best Seller", buttonName: "see more")
                BestSellerView(model: viewModel.bestSeller)
                    .padding(.horizontal, 12)
            }
            .task {
                await viewModel.getData()
            }
            
            .background(Color.ecColor(.gray))
            TabBarView(basket: viewModel.basket)
        }
        .background(Color.ecColor(.gray))
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ECViewModel(service: NetworkService()))
    }
}


