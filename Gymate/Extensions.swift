//
//  Extensions.swift
//  Gymate
//
//  Created by Han on 4/5/24.
//

import Foundation
import UIKit
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
