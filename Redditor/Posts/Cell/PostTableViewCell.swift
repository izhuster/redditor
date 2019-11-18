//
//  PostTableViewCell.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 17/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

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

    // MARK: - Private Properties
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var readStatusView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var commentsLabel: UILabel!
    @IBOutlet private weak var entryDateLabel: UILabel!
    
    // MARK: - Public Methods
    func configure(withTitle title: String, author: String) {
        titleLabel.text = title
        authorLabel.text = author
    }

}
