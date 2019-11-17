//
//  PostDetailViewController.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 16/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

final class PostDetailViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    var postTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = postTitle
    }

}
