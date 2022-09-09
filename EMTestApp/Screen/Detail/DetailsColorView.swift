//
//  DetailsColorView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 09.09.2022.
//

import SwiftUI

struct DetailsColorView: View {
    
    var color: [String]
    
    @Binding var selectedColor: String
    
    var body: some View {
        ForEach(color, id: \.self) { color in
            Button(action: {
                withAnimation(.easeInOut) { selectedColor = color }
            }) {
                Circle()
                    .fill(Color.init(hex: color))
                    .frame(width: 39.29, height: 39.29)
                    .overlay {
                        Image("Check")
                            .opacity(selectedColor == color ? 1 : 0)
                    }
            }
        }
    }
}

struct DetailsColorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsColorView(color: ["#772D03", "#010035"], selectedColor: .constant("#772D03"))
            .previewLayout(.sizeThatFits)
    }
}
