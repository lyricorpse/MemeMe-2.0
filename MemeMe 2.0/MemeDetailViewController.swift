//
//  MemeDetailViewController.swift
//  MemeMe 2.0
//
//  Created by Feng Zhu on 3/27/16.
//  Copyright © 2016 Feng Zhu. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var meme: Meme! = nil
    var editButton: UIBarButtonItem!
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "editMeme")
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = true
        memeImageView.image = meme.memedImg
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    func editMeme() {
        
        let editorVC = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        let navController = UINavigationController(rootViewController: editorVC)
        presentViewController(navController, animated: true, completion: nil)
        
    }
    
}
