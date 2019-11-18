//
//  ImageDownloader.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 18/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

final class ImageDownloader {
    static let `default` = ImageDownloader()
    let memoryStorage = MemoryStorage()
    private let session: URLSession
    private let sessionConfiguration = URLSessionConfiguration.ephemeral

    private init() {
        session = URLSession(configuration: sessionConfiguration)
    }

    func download(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {

        // Try to retrive data from memory storage first
        if let storageObject = memoryStorage.object(forKey: url.absoluteString) {
            completion(.success(storageObject.data))
            return
        }

        let dataTask = session.dataTask(with: url) { [weak self] (data: Data?, _: URLResponse?, error: Error?) in
            guard let self = self else { return }
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(DownloadError.dataIsNil))
                return
            }

            let storageObject = StorageObject(data: data, key: url.absoluteString)
            self.memoryStorage.setObject(storageObject, forKey: storageObject.key)
            completion(.success(data))
        }

        dataTask.resume()
    }
}

extension ImageDownloader {
    enum DownloadError: Error {
        case invalidURL
        case dataIsNil
        case imageDataCorrupted
    }
}
