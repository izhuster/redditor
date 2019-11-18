//
//  Repository.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

protocol Repository: AnyObject {
    associatedtype Item
    init(networkClient: NetworkClientProtocol)
    
    var count: Int { get }
    func fetchData(completion: ((Result<Bool, Error>) -> Void)?)
    func item(for indexPath: IndexPath) -> Item?
    func numberOfRows(inSection section: Int) -> Int
    func markAsSeen(withId id: String)
    func alreadySeen(withId id: String) -> Bool
    func removeItem(at indexPath: IndexPath)
    func removeAll()
}
