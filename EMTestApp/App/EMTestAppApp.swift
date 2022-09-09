//
//  EMTestAppApp.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 26.08.2022.
//

import SwiftUI

@main
struct EMTestAppApp: App {
    
    @StateObject var viewModel: ECViewModel = ECViewModel(service: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(viewModel)
        }
    }
}
