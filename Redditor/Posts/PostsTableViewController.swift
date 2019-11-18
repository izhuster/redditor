//
//  PostsTableViewController.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 16/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

final class PostsTableViewController: UITableViewController {

    var titles = ["1", "2"]
    
    var postRepository: PostRepository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postRepository?.fetchData(completion: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                print("fetch was successful: \(success)")
                if success {
                    DispatchQueue.main.async {
                        let indexSet = IndexSet(integer: 0)
                        self.tableView.reloadSections(indexSet, with: .automatic)
                    }
                }
            case .failure(let error):
                print(error)
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return postRepository?.sections ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postRepository?.numberOfRows(inSection: section) ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(for: indexPath) as PostTableViewCell
        
        guard let post = postRepository?.item(for: indexPath) else {
            return cell
        }
        
        cell.configure(withTitle: post.title, author: post.author)
        return cell
    }
    
    // MARK: - Navigation
    // MARK: -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        preparePostDetailViewController(for: segue, sender: sender)
    }
    
    private func preparePostDetailViewController(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell),
            let post = postRepository?.item(for: indexPath)
        else {
            assertionFailure("Expected a 'Post'")
            return
        }
        
        guard
            let navigationController = segue.destination as? UINavigationController,
            let postDetailViewController = navigationController.topViewController as? PostDetailViewController
        else {
            assertionFailure("Expected a 'PostDetailViewController'")
            return
        }
        
        postDetailViewController.post = post
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
