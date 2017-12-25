//
//  DataService.swift
//  MyHood
//
//  Created by Roman Subrychak on 12/24/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import Foundation
import UIKit

class DataService {
	
	private init() {}
	
	static let instance = DataService()
	
	private var _loadedPosts = [Post]()
	
	var loadedPosts: [Post] {
		return _loadedPosts
	}
	
	func savePosts() {
		let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
		
		UserDefaults.standard.set(postsData, forKey: "posts")
		UserDefaults.standard.synchronize()
	}
	
	func loadPosts() {
		guard let postsData = UserDefaults.standard.object(forKey: "posts") as? Data,
			let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post] else { return }
		
		_loadedPosts = postsArray
		
		NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
	}
	
	func saveImageAndCreatePath(image: UIImage) -> String {
		let imgData = UIImagePNGRepresentation(image)
		let imgPath = "image\(Date.timeIntervalSinceReferenceDate).png"
		let fullPath = documentPathForFileName(name: imgPath)

		do {
			try imgData?.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])
		} catch {
			fatalError()
		}
		
		
		return fullPath
	}
	
	func imageForPath(path: String) -> UIImage? {
		let image = UIImage(named: path)
		
		return image
	}
	
	func add(post: Post) {
		_loadedPosts.append(post)
		savePosts()
		loadPosts()
	}
	
	
	func documentPathForFileName(name: String) -> String {
		let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		
		let fullPath = paths[0] as NSString
		return fullPath.appendingPathComponent(name)
	}
}
