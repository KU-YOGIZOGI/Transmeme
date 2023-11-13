//
//  TransService.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/10.
//

import Foundation

func fetchTranslation(for slangWord: String, completion: @escaping (TranslationResponse?) -> Void) {
    print("fetchTranslation 호출됨: \(slangWord)") // 함수 호출 로그
    
    guard let encodedSlangWord = slangWord.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
         print("Failed to encode slangWord: \(slangWord)") // 인코딩 실패 로그
         completion(nil)
         return
     }

     let urlString = "https://transmeme.store/word/\(encodedSlangWord)"
     guard let url = URL(string: urlString) else {
         print("Invalid URL: \(urlString)") // 잘못된 URL 로그
         completion(nil)
         return
     }
    print("URL 생성 성공: \(url)") // URL 생성 로그

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error fetching translation: \(error)") // 네트워크 요청 오류 로그
            completion(nil)
        } else if let data = data {
            do {
                let translationResponse = try JSONDecoder().decode(TranslationResponse.self, from: data)
                print("디코딩 성공: \(translationResponse)") // 디코딩 성공 로그
                completion(translationResponse)
            } catch {
                print("Error decoding translation response: \(error)") // 디코딩 오류 로그
                completion(nil)
            }
        } else {
            print("No data received") // 데이터 미수신 로그
        }
    }

    task.resume()
}
