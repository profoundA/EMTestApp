//
//  DetailsCategoryView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 09.09.2022.
//

import SwiftUI

var categoryTabs = ["Shop", "Details", "Features"]

struct DetailsCategoryView: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
            
            HStack {
                ForEach(categoryTabs, id: \.self, content: { item in
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) { selectedTab = item }
                        }) {
                            VStack(spacing: 8) {
                                Text(item)
                                    .font(Font.markpro(.bold, size: 20))
                                    .foregroundColor(selectedTab == item ? .black : Color.ecColor(.itemGray))
                                Divider()
                                    .frame(width: 86, height: 3)
                                    .background(Color.ecColor(.orange))
                                    .opacity(selectedTab == item ? 1 : 0)
                            }
                        }
                })
                .padding(.horizontal)
            }
    }
}

struct DetailsCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCategoryView(selectedTab: .constant("Shop"))
    }
}
