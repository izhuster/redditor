//
//  NetworkClient.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

final class NetworkClient: NetworkClientProtocol {
    let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func requestTopPosts(completion: @escaping (Result<Response<Post>, Error>) -> Void) {
        guard let request = Endpoint.top.createRequest() else {
            completion(.failure(EndpointError.invalidURL))
            return
        }
        
        start(request: request, urlSession: urlSession, completion: completion)
    }
 
    
    private func start<Model: Codable>(request: URLRequest, urlSession: URLSession, completion: @escaping (Result<Model, Error>) -> Void) {
        let task = urlSession.dataTask(with: request) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(EndpointError.dataIsNil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Model.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }

}
