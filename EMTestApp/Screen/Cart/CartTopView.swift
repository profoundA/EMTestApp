//
//  CartTopView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 07.09.2022.
//

import SwiftUI

struct CartTopView: View {
    
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
            HStack {
                Text("Add address")
                    .font(Font.markpro(.medium, size: 15))
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.ecColor(.orange))
                    .frame(width: 37, height: 37)
                    .overlay {
                        Image("Pointer")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        
                    }
            }
            .padding(.horizontal, 35)
        }
    }
}

struct CartTopView_Previews: PreviewProvider {
    static var previews: some View {
        CartTopView()
            .previewLayout(.sizeThatFits)
    }
}
