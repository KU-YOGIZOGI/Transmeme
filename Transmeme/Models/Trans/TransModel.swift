//
//  TransModel.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/08.
//

import Foundation

struct TranslationResponse: Codable {
    let slangWord: String
    let standardWord: String
    let generation: String
    let meaning: String
    let exampleSentences: [String]
    let similarWords: [String]
}
