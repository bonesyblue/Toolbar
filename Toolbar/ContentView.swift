//
//  ContentView.swift
//  Toolbar
//
//  Created by Jonathan Bones on 19.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CounterView()
    }
}

struct CounterView: View {
    @EnvironmentObject var counter: CounterSubState
    
    var body: some View {
        VStack {
            Text("You have pressed the button \(counter.count) times")
            Button(
                action: { counter.count += 1 },
                label: {
                    Text("Increment")
                }
            )
        }.frame(width: 200, height: 200, alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
