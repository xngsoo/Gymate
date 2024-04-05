//
//  CommonTextFieldStyle.swift
//  Gymate
//
//  Created by Han on 4/2/24.
//

import Foundation
import SwiftUI

struct CommonTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        configuration
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
