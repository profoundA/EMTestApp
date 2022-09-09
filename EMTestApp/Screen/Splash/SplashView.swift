//
//  SplashView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 31.08.2022.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var opacity = 0.0
    
    @EnvironmentObject var viewModel: ECViewModel
    
    var body: some View {
        
        if isActive {
            HomeView()
        } else {
            Splash(opacity: $opacity, isActive: $isActive)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(ECViewModel(service: NetworkService()))
    }
}

