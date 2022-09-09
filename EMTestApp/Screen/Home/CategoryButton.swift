//
//  CategoryButton.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 31.08.2022.
//

import SwiftUI

struct CategoryButton: View {
    
    var name: String = "Phones"
    
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button(action: {
            withAnimation(.easeIn) { selectedTab = name }
        }) {
            VStack {
                Circle()
                    .fill(selectedTab == name ? Color.ecColor(.orange) : .white)
                    .frame(width: 71, height: 71)
                    .shadow(color: .gray.opacity(0.1), radius: 10, x: 0, y: 0)
                    .overlay(
                        Image(name)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == name ? .white : Color.ecColor(.itemGray))
                    )
                Text(name)
                    .foregroundColor(selectedTab == name ? Color.ecColor(.orange) : .black)
                    .font(Font.markpro(.medium, size: 12))
            }
        }
        
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryButton(selectedTab: .constant("Phones"))
            CategoryButton(selectedTab: .constant(""))
        }
        .previewLayout(.sizeThatFits)
    }
}
