//
//  FileDataApp.swift
//  FileData
//
//  Created by Herve Crespel on 21/07/2024.
//

import SwiftUI

@main
struct FileDataApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: CompteDocument(CM)) { file in
            ContentView(document: file.$document)
        }
    }
}
