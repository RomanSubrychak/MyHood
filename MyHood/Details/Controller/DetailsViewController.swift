//
//  DetailsViewController.swift
//  MyHood
//
//  Created by Roman Subrychak on 12/25/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
	
	@IBOutlet weak var titleLbl : UILabel!
	@IBOutlet weak var imageView : UIImageView!
	@IBOutlet weak var descTextView : UITextView!
	
	var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
		titleLbl.text = post?.title
		if let imagePath = post?.imagePath {
			imageView.image = DataService.instance.imageForPath(path: imagePath)
		}
		descTextView.text = post?.postDescription
    }
	
	@IBAction func backBtnPressed(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
}
