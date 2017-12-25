//
//  Post.swift
//  MyHood
//
//  Created by Roman Subrychak on 12/24/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import Foundation

class Post: NSObject {
	private(set) public var imagePath: String!
	private(set) public var title: String!
	private(set) public var postDescription: String!
	
	init(imagePath: String, title: String, postDescription: String) {
		self.imagePath = imagePath
		self.title = title
		self.postDescription = postDescription
	}
	
	override convenience init() {
		self.init(imagePath:"", title: "", postDescription: "")
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		
		guard let imagePath = aDecoder.decodeObject(forKey: "imagePath") as? String,
			let postDescription = aDecoder.decodeObject(forKey: "description") as? String,
			let title = aDecoder.decodeObject(forKey: "title") as? String else { return nil }
		
		self.init(imagePath: imagePath, title: title, postDescription: postDescription)
	}
}

extension Post: NSCoding {
	
	func encode(with aCoder: NSCoder) {
		
		aCoder.encode(self.imagePath, forKey: "imagePath")
		aCoder.encode(self.postDescription, forKey: "description")
		aCoder.encode(self.title, forKey: "title")
	}
}
