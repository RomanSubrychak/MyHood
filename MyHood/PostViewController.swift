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
		
		let post = Post(imagePath: "", title: "Post 1",
		                postDescription: "Post 1 Description")
		let post2 = Post(imagePath: "", title: "Post 2",
		                 postDescription: "I am the second post. Yipeee!")
		let post3 = Post(imagePath: "", title: "Post 3",
		                 postDescription: "I am the most important post.")
		
		posts.append(post)
		posts.append(post2)
		posts.append(post3)
		
		tableView.reloadData()
	}
}

extension PostViewController: UITableViewDataSource {
	
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return posts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let post = posts[indexPath.row]
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
			return PostCell()
		}
		
		cell.configureCell(post)
		
		return cell
	}
}
