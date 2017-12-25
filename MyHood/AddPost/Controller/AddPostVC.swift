//
//  AddPostVC.swift
//  MyHood
//
//  Created by Roman Subrychak on 12/24/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {
	
	@IBOutlet weak var titleField : UITextField!
	@IBOutlet weak var postImg : UIImageView!
	@IBOutlet weak var descField : UITextField!
	
	var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		postImg.layer.cornerRadius = 120
		
		imagePicker = UIImagePickerController()
		
		imagePicker.delegate = self
    }

	@IBAction func addPicBtnPressed(_ sender: UIButton) {
		sender.setTitle("", for: .normal)
		
		present(imagePicker, animated: true, completion: nil)
	}
	
	@IBAction func makePostBntPressed(_ sender: UIButton) {
		
		if let title = titleField.text, let desc = descField.text,
			let img = postImg.image {
			
			let imgPath = DataService.instance.saveImageAndCreatePath(image: img)
			
			let post = Post(imagePath: imgPath, title: title, postDescription: desc)
			
			DataService.instance.add(post: post)
			
			dismiss(animated: true, completion: nil)
		}
			
	}
	
	@IBAction func cancelBtnPressed(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
}

extension AddPostVC: UIImagePickerControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
		let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
		
		imagePicker.dismiss(animated: true, completion: nil)
		
		postImg.image = selectedImage
	}
}

extension AddPostVC: UINavigationControllerDelegate {
	
}
