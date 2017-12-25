//
//  ViewController.swift
//  MyHood
//
//  Created by Roman Subrychak on 12/24/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
	
	var posts = [Post]()

	@IBOutlet weak var tableView : UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.dataSource = self
		
		DataService.instance.loadPosts()
		
		NotificationCenter.default.addObserver(self, selector: #selector(PostViewController.onPostsLoaded(_:)), name: Notification.Name(rawValue: "postsLoaded"), object: nil)
	}
	
	@objc func onPostsLoaded(_ notification: Notification) {
		tableView.reloadData()
	}
}

extension PostViewController: UITableViewDataSource {
	
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return DataService.instance.loadedPosts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let post = DataService.instance.loadedPosts[indexPath.row]
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
			return PostCell()
		}
		
		cell.configureCell(post)
		
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard  let identifier = segue.identifier, identifier == "details",
		let index = tableView.indexPathForSelectedRow?.row
		else { return }
		
		if let destinationVC = segue.destination as? DetailsViewController {
			let post = DataService.instance.loadedPosts[index]
			destinationVC.post = post
		}
	}
}
