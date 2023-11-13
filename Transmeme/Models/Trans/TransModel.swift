//
//  TransModel.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/08.
//

import Foundation

struct TranslationResponse: Codable {
    let standardWord: String
    let generation: String
    let meaning: String
    let example: String
    let similarWords: String
    let similarWordsGen: String

    
    private enum CodingKeys: String, CodingKey {
        case standardWord = "definition"
        case generation
        case meaning = "scripts"
        case example
        case similarWords = "similar"
        case similarWordsGen = "similar_gen"
    }

    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        standardWord = try container.decode(String.self, forKey: .standardWord)
        generation = try container.decode(String.self, forKey: .generation)
        meaning = try container.decode(String.self, forKey: .meaning)
        example = try container.decode(String.self, forKey: .example)
        similarWords = try container.decode(String.self, forKey: .similarWords)
        similarWordsGen = try container.decode(String.self, forKey: .similarWordsGen)
    }
}
