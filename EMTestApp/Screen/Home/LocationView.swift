//
//  LocationView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 04.09.2022.
//

import SwiftUI
import SwiftUIBackports

struct LocationView: View {
    @State var isPresented: Bool = false
    var body: some View {
        HStack {
            HStack {
                Image("Pointer")
                Text("Zihuatanejo, Gro")
                    .font(Font.markpro(.medium, size: 15))
                Image("DownArrow")
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            }
            .offset(x: 10)
            Button(action: {
                isPresented.toggle()
            }) {
                Image("Filter")
            }
            .offset(x: 76)
            .sheet(isPresented: $isPresented) {
                FilterView()
                    .backport.presentationDetents([.medium])
                    .backport.presentationUndimmed(from: .medium)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
