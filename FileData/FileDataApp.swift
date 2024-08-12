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
        
        Window("Activity", id: "activity") {
                    ReadingActivity()//store: store)
                }
  
        MenuBarExtra("Utility App", systemImage: "hammer") {
            AppMenu()
        }
        .menuBarExtraStyle(.window)
    }
}




struct AppMenu: View {
    var body: some View {
        Text("App Menu Item")
    }
}

struct ReadingActivity: View {
   // @ObservedObject var store: ReadingListStore

    var body: some View {
        Text("Reading Activity")
    }
}
