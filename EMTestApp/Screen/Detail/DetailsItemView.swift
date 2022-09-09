//
//  DetailsItemView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 09.09.2022.
//

import SwiftUI

struct DetailsItemView: View {
    
    var image: String
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
                    .scaledToFit()
//                    .scaleEffect(1, anchor: .center)
                    .padding(.vertical,10)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .frame(width: 270, height: 320)
                    }
                    
            } placeholder: {
                ProgressView()
            }

        }
    }
}

struct DetailsItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsItemView(image: "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig")
    }
}
