//
//  SearchView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 04.09.2022.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .gray.opacity(0.1), radius: 10, x: 0, y: 0)
                .frame(width: 290, height: 34)
                .overlay(alignment: .leading, content: {
                    HStack {
                        Image("MagGlass")
                            .foregroundColor(Color.ecColor(.orange))
                        Text("Search")
                            .foregroundColor(Color.ecColor(.itemGray))
                            .font(Font.markpro(.regular, size: 12))
                    }
                    .padding(.horizontal)
                })
                
            Button(action: {}) {
                ZStack {
                    Circle()
                        .fill(Color.ecColor(.orange))
                        .frame(width: 34, height: 34)
                    Image("QR")
                }
                .padding(.trailing, 20)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewLayout(.sizeThatFits)
    }
}
