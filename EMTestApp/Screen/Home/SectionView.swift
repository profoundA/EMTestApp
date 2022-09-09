//
//  SectionView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 31.08.2022.
//

import SwiftUI

struct SectionView: View {
    var name: String
    var buttonName: String
    
    var body: some View {
        HStack {
            Text(name)
                .font(Font.markpro(.bold, size: 25))
                .padding(.horizontal)
            Spacer()
            Button(action: {}) {
                Text(buttonName)
                    .font(Font.markpro(.regular, size: 15))
                    .foregroundColor(Color.ecColor(.orange))
            }
            .padding(.horizontal)
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SectionView(name: "Section name", buttonName: "button name")
            SectionView(name: "Aaaaaaaaaaaaa", buttonName: "bbbbbbbbbbb")
        }
        .previewLayout(.sizeThatFits)
    }
}
