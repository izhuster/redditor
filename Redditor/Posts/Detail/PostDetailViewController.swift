//
//  PostDetailViewController.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 16/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

final class PostDetailViewController: UIViewController {
    
    @IBOutlet var emptyView: UIView!
    
    var postTitle: String?
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let post = post else {
            view.addSubview(emptyView)
            return
        }
        
        
    }

}
