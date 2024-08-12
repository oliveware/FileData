//
//  DesComptes.swift
//  FileData
//
//  Created by Herve Crespel on 08/08/2024.
//

import SwiftUI
import UniformTypeIdentifiers
import Oware


struct DesComptes: FileDocument {
    var text = Argent(CompteCourant())
    
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
