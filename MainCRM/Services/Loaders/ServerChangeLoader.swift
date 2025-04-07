//
//  ServerChangeLoader.swift
//  MainCRM
//
//  Created by Main on 06.04.2025.
//

import Foundation

protocol ServerChangeLoading {
    func loadServerChanges(handler: @escaping (Result<ChangeWebviewOnServer, Error>) -> Void)
}

struct ServerChangeLoader: ServerChangeLoading {
    private var networkClient: NetworkClient
    private var serverUrl: URL
    
    init(networkClient: NetworkClient, serverUrl: URL) {
        self.networkClient = networkClient
        self.serverUrl = serverUrl
    }
    
    func loadServerChanges(handler: @escaping (Result<ChangeWebviewOnServer, Error>) -> Void) {
        networkClient.fetch(url: serverUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(ChangeWebviewOnServer.self, from: data)
                    handler(.success(results))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
