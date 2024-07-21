//
//  ContentView.swift
//  FileData
//
//  Created by Herve Crespel on 21/07/2024.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: FileDataDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(FileDataDocument()))
}
