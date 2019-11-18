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
    private var seenPosts: Set<String> = []
    var count: Int {
        return posts.count
    }
    
    var sections: Int {
        return 1
    }
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func item(for indexPath: IndexPath) -> Item? {
        guard indexPath.row < posts.count else {
            return nil
        }
        let post = posts[indexPath.row]
        return post
    }
    
    func fetchData(completion: ((Result<Bool, Error>) -> Void)?) {
        networkClient.requestTopPosts { (result) in
            switch result {
            case .success(let response):
                let posts = response.data.children.map { $0.data }
                self.posts = posts
                print(posts.count)
                
                completion?(.success(true))
                
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return posts.count
    }
    
    func markAsSeen(withId id: String) {
        seenPosts.insert(id)
    }
    
    func alreadySeen(withId id: String) -> Bool {
        return seenPosts.contains(id)
    }
}
