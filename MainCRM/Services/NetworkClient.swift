//
//  NetworkClient.swift
//  MainCRM
//
//  Created by Main on 06.04.2025.
//

import Foundation

/// Отвечает за загрузку данных по URL
struct NetworkClient {
    var isPost: Bool = false
    var valuesArray: [String] = []

    private enum NetworkError: Error {
        case codeError
    }
    
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        
        if isPost {
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: valuesArray)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Проверяем, пришла ли ошибка
            if let error = error {
                handler(.failure(error))
                return
            }
            
            // Проверяем, что нам пришёл успешный код ответа
            if let response = response as? HTTPURLResponse,
                response.statusCode < 200 || response.statusCode >= 300 {
                handler(.failure(NetworkError.codeError))
                return
            }
            
            // Возвращаем данные
            guard let data = data else { return }
            handler(.success(data))
        }
        
        task.resume()
    }
}
