//
//  PostRepository.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

final class PostRepository: Repository {
    typealias Item = Post
    private let networkClient: NetworkClientProtocol
    private var posts: [Post] = []
    
    var count: Int {
        return posts.count
    }
    
    var sections: Int {
        return 1
    }
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
        posts = [
            Post(title: "My First Title"),
            Post(title: "My second title")
        ]
    }
    
    func item(for indexPath: IndexPath) -> Item? {
        guard indexPath.row < posts.count else {
            return nil
        }
        let post = posts[indexPath.row]
        return post
    }
    
    func fetchData(completion: ((Result<Bool, Error>) -> Void)?) {
        assertionFailure("Not yet implemented.")
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return posts.count
    }
}
