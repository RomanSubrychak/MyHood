//
//  PostCell.swift
//  MyHood
//
//  Created by Roman Subrychak on 12/24/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
	
	@IBOutlet weak var postImg : UIImageView!
	@IBOutlet weak var titleLbl : UILabel!
	@IBOutlet weak var descLbl : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

	public func configureCell(_ post: Post) {
		titleLbl.text = post.title
		descLbl.text = post.postDescription
	}
}
