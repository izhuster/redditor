//
//  NetworkClientProtocol.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

protocol NetworkClientProtocol {
    init(urlSession: URLSession)
    func requestTopPosts(completion: @escaping (Result<Response<Post>, Error>) -> Void)
}
