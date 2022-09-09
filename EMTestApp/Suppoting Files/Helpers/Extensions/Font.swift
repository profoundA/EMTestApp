//
//  Font.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 26.08.2022.
//

import SwiftUI

extension Font {
    enum MarkPro {
        case regular
        case medium
        case bold
        case black
        
        var value: String {
            switch self {
            case .regular:
                return "MarkPro-Regular"
                
            case .medium:
                return "MarkPro-Medium"
                
            case .bold:
                return "MarkPro-Bold"
                
            case .black:
                return "MarkPro-Black"
            }
        }
    }
    static func markpro(_ type: MarkPro, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
}
