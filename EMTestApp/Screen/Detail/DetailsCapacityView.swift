//
//  DetailsCapacityView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 09.09.2022.
//

import SwiftUI

struct DetailsCapacityView: View {
    
    @Binding var selectedCapacity: String
    
    var capacity: [String]
    
    var body: some View {
        
        ForEach(capacity, id: \.self) { capacity in
            Button(action: {
                withAnimation(.easeInOut) { selectedCapacity = capacity }
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(selectedCapacity == capacity ? Color.ecColor(.orange) : .white)
                    .frame(width: 71, height: 30)
                    .overlay {
                        Text(capacity)
                            .font(Font.markpro(.bold, size: 13))
                            .foregroundColor(selectedCapacity == capacity ? .white : Color.ecColor(.itemGray))
                    }
            }
        }
    }
}

struct DetailsCapacityView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCapacityView(selectedCapacity: .constant("126"), capacity: ["126", "252"])
    }
}
