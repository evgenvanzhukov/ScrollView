//
//  TextLoader.swift
//  ScrollView
//
//  Created by Evgen on 09.01.2023.
//  Copyright © 2023 Evgen. All rights reserved.
//

import Foundation


class TextLoader {
    static func load() -> String {

        if let url = Bundle.main.url(forResource: "lorem", withExtension: "md"),
           let text = try? String(contentsOf: url, encoding: .utf8) {
            return text
        }
        
        return ""
    }
}
