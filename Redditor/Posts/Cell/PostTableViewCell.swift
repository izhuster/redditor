//
//  PostTableViewCell.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

protocol PostTableViewCellDelegate: AnyObject {
    func postTableViewCell(_ cell: PostTableViewCell, didSelectRemove sender: UIButton)
}

final class PostTableViewCell: UITableViewCell {
    // MARK: - Public Properties
    var alreadySeen: Bool = false {
        didSet {
            let backgroundColor: UIColor = alreadySeen ? .systemBackground : .systemBlue
            UIView.animate(withDuration: 0.25) {
                self.readStatusView.backgroundColor = backgroundColor
            }
        }
    }
    
    weak var delegate: PostTableViewCellDelegate?

    // MARK: - Private Properties
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var readStatusView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var commentsLabel: UILabel!
    @IBOutlet private weak var entryDateLabel: UILabel!
    
    // MARK: - Private Methods
    @IBAction private func removeTouchUpInside(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.postTableViewCell(self, didSelectRemove: sender)
        } else {
            print("Delegate not set.")
        }
    }
    
    // MARK: - Public Methods
    func configure(
        withTitle title: String,
        author: String,
        numberOfComments: String,
        elapsedTime: String,
        thumbnailUrl: String)
    {
        titleLabel.text = title
        authorLabel.text = "By: " + author
        commentsLabel.text = "\(numberOfComments) comments"
        entryDateLabel.text = elapsedTime
        let placeholder = UIImage(systemName: "dot.radiowaves.left.and.right")
        let urlString = thumbnailUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        postImageView.downloadImage(with: URL(string: urlString), placeholderImage: placeholder)
    }

}
