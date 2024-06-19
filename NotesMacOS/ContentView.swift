//
//  ContentView.swift
//  NotesMacOS
//
//  Created by Tauan Tathiell Camargo on 19/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .buttonStyle(BorderlessButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
    }
}

#Preview {
    ContentView()
}
