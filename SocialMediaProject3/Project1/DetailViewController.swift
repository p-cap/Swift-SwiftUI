//
//  DetailViewController.swift
//  Project1
//
//  Created by Paul Capili on 2/3/21.
//

import UIKit
import LinkPresentation

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    @objc func shareTapped() {
            
        let vc = UIActivityViewController(activityItems: [selectedImage!], applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

// Below is editing the info.plist file

// There’s one small but important bug with the current code: if you select Save Image inside the activity view controller, you’ll see the app crashes immediately. What’s happening here is that our app tries to access the user’s photo library so it can write the image there, but that isn’t allowed on iOS unless the user grants permission first.

// To fix this we need to edit the Info.plist file for our project. We haven’t touched this yet, but it’s designed to hold configuration settings for your app that won’t ever change over time

// Select Info.plist in the project navigator, then when you see a big table full of data please right- click in the white space below that. Click “Add Row” from the menu that appears, and you should see a new list of options appear that starts with “Application Category”. What I’d like you to do is scroll down in that list and find the name “Privacy - Photo Library Additions Usage Description”. This is what will be shown to the user when your app needs to
