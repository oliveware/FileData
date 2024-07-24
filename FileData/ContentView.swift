//
//  ContentView.swift
//  FileData
//
//  Created by Herve Crespel on 21/07/2024.
//

import SwiftUI
import Attribex

struct ContentView: View {
    @Binding var document: CompteDocument

    var body: some View {
        //TextEditor(text: $document.text)
        CompteView($document.text.compte)
    }
}

#Preview {
    ContentView(document: .constant(CompteDocument("sg")))
}
