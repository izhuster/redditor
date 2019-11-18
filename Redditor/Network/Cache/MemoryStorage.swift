//
//  MemoryStorage.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 18/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import Foundation

final class MemoryStorage {
    private let imageCache = NSCache<NSString, StorageObject>()

    func object(forKey key: String) -> StorageObject? {
        return imageCache.object(forKey: key as NSString)
    }

    func setObject(_ object: StorageObject, forKey key: String) {
        imageCache.setObject(object, forKey: key as NSString)
    }
}
