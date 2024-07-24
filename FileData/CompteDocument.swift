//
//  CompteDoc.swift
//  FileData
//
//  Created by Herve Crespel on 22/07/2024.
//

import SwiftUI
import UniformTypeIdentifiers
import Oware
import Semantex

extension UTType {
    static var jsonText: UTType {
        UTType(importedAs: "public.json")
    }
    /*static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }*/
}



struct CompteDocument: FileDocument {
    var text = CompteCourant()
    
    init(_ string:String)  {
        do {
            guard let json = string.data(using: .utf8)
            else {
                throw CocoaError(.fileReadCorruptFile)
            }
            let compte = try JSONDecoder().decode(CompteCourant.Comptejson.self, from: json)
            text = CompteCourant(compte)
        }
        catch {
            print ("inexistant \(error)")
        }
    }

    static var readableContentTypes: [UTType] { [.jsonText] }
    //static var readableContentTypes: [UTType] { [.exampleText] }

    init(configuration: ReadConfiguration) throws {
        guard let json = configuration.file.regularFileContents
             //, let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        //text = string
        text = try JSONDecoder().decode(CompteCourant.self, from: json)
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let json = try JSONEncoder().encode(text)
       // let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: json)
    }
}
