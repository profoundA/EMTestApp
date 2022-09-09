//
//  Splash.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 31.08.2022.
//

import SwiftUI

struct Splash: View {
    @Binding var opacity: Double
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            Color.ecColor(.blue)
                .ignoresSafeArea()
            
            Circle()
                .fill(Color.ecColor(.orange))
                .frame(width: 132, height: 132, alignment: .center)
                .opacity(opacity)
            
            Text("Eccommerce\nConcept")
                .font(Font.markpro(.bold, size: 30))
                .foregroundColor(.white)
                .frame(width: 300, height: 100, alignment: .trailing)
                .opacity(opacity)
        }
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                opacity = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.isActive = true
            }
        }
    }
}

struct Splash_Previws: PreviewProvider {
    static var previews: some View {
        Splash(opacity: .constant(1.0), isActive: .constant(false))
    }
}
