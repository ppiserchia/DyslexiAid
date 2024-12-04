//
//  ContentView.swift
//  DyslexiAid
//
//  Created by Pasquale Piserchia on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Push to dev")
            Text("Push to dev another time")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
