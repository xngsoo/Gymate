//
//  Timer.swift
//  Gymate
//
//  Created by Han on 4/23/24.
//

import Foundation
import Combine
import SwiftUI

class MyTimer: ObservableObject {
    @Published var value = 0.0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.value += 0.1
        }
    }
}
