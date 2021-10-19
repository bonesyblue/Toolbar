//
//  CounterState.swift
//  Toolbar
//
//  Created by Jonathan Bones on 19.10.21.
//

import Foundation

class CounterSubState: ObservableObject {
    @Published var count: Int = 0
}

class CounterState: ObservableObject {
    var state = CounterSubState()
}
