//
//  SymbolLoader.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import Foundation

class SymbolLoader {
    
    
    /// Loads symbols programatically from the system
    /// - Returns: a list of strings representing the symbols' names
    public static func loadSymbolsFromSystem() -> [String] {
        var symbols = [String]()
        if let bundle = Bundle(identifier: "com.apple.CoreGlyphs"),
           let resourcePath = bundle.path(forResource: "name_availability", ofType: "plist"),
           let plist = NSDictionary(contentsOfFile: resourcePath),
           let plistSymbols = plist["symbols"] as? [String: String]
        {
            symbols = Array(plistSymbols.keys)
            
        }
        return symbols
    }
    
}