//
//  DetailsSpecView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 09.09.2022.
//

import SwiftUI

struct DetailsSpecView: View {
    
    let image: String
    let specs: String
    
    var body: some View {
        VStack {
            Image(image)
            Text(specs)
                .font(Font.markpro(.regular, size: 11))
                .foregroundColor(Color.ecColor(.itemGray))
        }
    }
}

struct DetailsSpecView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsSpecView(image: "CPU", specs: "Exynos 990")
    }
}
