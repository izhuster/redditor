//
//  PostsTableViewController.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 16/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

final class PostsTableViewController: UITableViewController {

    // MARK: - Public Properties
    // MARK: -
    var postRepository: PostRepository?
    @IBOutlet private var dismissAllContainerView: UIView!
    
    // MARK: - Life View Cycle
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("Posts", comment: "")
        configureTableView()
        requestFetchData()
    }
    
    // MARK: - Network
    // MARK: -
    private func requestFetchData() {
        postRepository?.fetchData(completion: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                print("fetch was successful: \(success)")
                if success {
                    self.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    // MARK: - Configurations
    // MARK: -
    private func configureTableView() {
        tableView.tableFooterView = dismissAllContainerView
    }
    
    // MARK: - Actions
    // MARK: -
    @IBAction func dismissAllPostsTouchUpInside(_ sender: UIButton) {
        postRepository?.removeAll()
        reloadData()
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            let indexSet = IndexSet(integer: 0)
            self.tableView.reloadSections(indexSet, with: .automatic)
        }
    }

    // MARK: - Table view data source
    // MARK: -
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
        
        let elapsedTime = Date(timeIntervalSince1970: Double(post.created)).elapsedTime()
        cell.alreadySeen = postRepository?.alreadySeen(withId: post.id) ?? false
        cell.delegate = self
        cell.configure(
            withTitle: post.title,
            author: post.author,
            numberOfComments: "\(post.numberOfComments)",
            elapsedTime: elapsedTime
        )
        return cell
    }
    
    // MARK: - Navigation
    // MARK: -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        preparePostDetailViewController(for: segue, sender: sender)
    }
    
    private func preparePostDetailViewController(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let cell = sender as? PostTableViewCell,
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
        postRepository?.markAsSeen(withId: post.id)
        cell.alreadySeen = postRepository?.alreadySeen(withId: post.id) ?? false
        postDetailViewController.post = post
    }

    // MARK: - Table view delegate
    // MARK: -
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            postRepository?.removeItem(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

}

// MARK: - PostTableViewCellDelegate
// MARK: -
extension PostsTableViewController: PostTableViewCellDelegate {
    func postTableViewCell(_ cell: PostTableViewCell, didSelectRemove sender: UIButton) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
    
        postRepository?.removeItem(at: indexPath)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
