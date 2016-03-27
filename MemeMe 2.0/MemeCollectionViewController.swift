//
//  MemeCollectionViewController.swift
//  MemeMe 2.0
//
//  Created by Feng Zhu on 3/25/16.
//  Copyright © 2016 Feng Zhu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MemeCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addMeme") {
            let editorVC = segue.destinationViewController as! MemeEditorViewController
        }
    }
    
    @IBAction func addMeme(sender: UIBarButtonItem) {
        performSegueWithIdentifier("addMeme", sender: nil)
    }
    


}
