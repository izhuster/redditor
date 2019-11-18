//
//  PostDetailViewController.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 16/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

final class PostDetailViewController: UIViewController {
    
    @IBOutlet private var emptyView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var entryDateLabel: UILabel!
    @IBOutlet private weak var numberOfCommentsLabel: UILabel!
    
    private lazy var contentViews = [
        imageView,
        titleLabel,
        authorLabel,
        entryDateLabel,
        numberOfCommentsLabel
    ]
    
    var postTitle: String?
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let post = post else {
            contentViews.forEach { $0?.isHidden = true }
            view.addSubview(emptyView)
            emptyView.centerToSuperview()
            return
        }
        
        contentViews.forEach { $0?.isHidden = false }
        
        navigationItem.title = post.author
        titleLabel.text = post.title
        authorLabel.text = "By: " + post.author
        numberOfCommentsLabel.text = "\(post.numberOfComments) comments"
        let elapsedTime = Date(timeIntervalSince1970: Double(post.created)).elapsedTime()
        entryDateLabel.text = elapsedTime
    }

}
