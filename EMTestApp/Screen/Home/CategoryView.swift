//
//  CategoryView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 04.09.2022.
//

import SwiftUI

var scrollTabs = ["Phones", "Computer", "Health", "Books"]

struct CategoryView: View {
    @Binding var selectedTab: String
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            
            HStack(spacing: -10) {
                ForEach(scrollTabs, id: \.self, content: { item in
                    CategoryButton(name: item, selectedTab: $selectedTab)
                })
                .padding(.horizontal)
            }
        })
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(selectedTab: .constant(scrollTabs[0]))
    }
}
