//
//  DetailsTopView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 08.09.2022.
//

import SwiftUI

struct DetailsTopView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button(action: { dismiss() }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.ecColor(.blue))
                    .frame(width: 37, height: 37)
                    .overlay{
                        Image("LeftArrow")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(270))
                    }
            }
            .padding(.horizontal, 32)
            Spacer()
            
            Text("Product Details")
                .font(Font.markpro(.medium, size: 15))
                .frame(width: 180)
                .padding(.leading, 10)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.ecColor(.orange))
                .frame(width: 37, height: 37)
                .overlay {
                    Image("Bag")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 35)
        }
    }
}

struct DetailsTopView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsTopView()
            .previewLayout(.sizeThatFits)
    }
}
