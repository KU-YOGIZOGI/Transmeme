//
//  TransService.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/10.
//

import Foundation

func fetchTranslation(for slangWord: String, completion: @escaping (TranslationResponse?) -> Void) {
    let urlString = "http://43.202.102.163:8080/api/word=\(slangWord)"
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        completion(nil)
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            // 오류가 있을 경우 출력
            print("Error fetching translation: \(error)")
            completion(nil)
        } else if let data = data {
            // 성공적으로 데이터를 받았을 경우 출력
            do {
                // JSON 디코딩을 시도하고 결과를 출력
                let translationResponse = try JSONDecoder().decode(TranslationResponse.self, from: data)
                completion(translationResponse)
            } catch {
                // 디코딩 과정에서 오류가 발생한 경우 출력
                print("Error decoding translation response: \(error)")
                completion(nil)
            }
        }
    }

    task.resume()
}
