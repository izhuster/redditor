//
//  UIImageView+ImageDownloader.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 18/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

extension UIImageView {
    /// Download image with provided URL and sets it automatically to `UIImageView` image property if successful.
    func downloadImage(
        with url: URL?,
        placeholderImage: UIImage?,
        completion: ((Result<UIImage, Error>) -> Void)? = nil) {
        guard let url = url else {
            completion?(.failure(ImageDownloader.DownloadError.invalidURL))
            return
        }

        ImageDownloader.default.download(url: url) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    completion?(.failure(ImageDownloader.DownloadError.imageDataCorrupted))
                    return
                }

                DispatchQueue.main.async {
                    self.image = image
                }

                completion?(.success(image))

            case .failure(let error):
                print("url: \(url.absoluteString). ERROR: \(error)")
                DispatchQueue.main.async {
                    self.image = placeholderImage
                }
                completion?(.failure(error))
            }
        }
    }
}
