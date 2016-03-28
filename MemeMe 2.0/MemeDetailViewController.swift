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
    var didEdit: Bool!
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MemeDetailViewController.editMeme))
        self.navigationItem.rightBarButtonItem = editButton
        didEdit = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = true
        memeImageView.image = meme.memedImg
        
        if didEdit! {
            didEdit = false
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    func editMeme() {

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let editorVC = mainStoryboard.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        editorVC.memeToBeEdited = meme
        editorVC.isEditMode = true
        
        navigationController?.presentViewController(editorVC, animated: true, completion:nil)
        
        didEdit = true
    }
    
}
