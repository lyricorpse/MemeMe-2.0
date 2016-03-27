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

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    func setItemDimension(size: CGSize) {
        let space: CGFloat = 3.0
        var dimension: CGFloat
        var itemsPerRow: Int!
        
        if (size.height > size.width) {
            itemsPerRow = 3
        } else {
            itemsPerRow = 5
        }
        
        dimension = (size.width - (CGFloat(itemsPerRow - 1) * space)) / CGFloat(itemsPerRow)
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setItemDimension(self.view.frame.size)
    }

    override func viewWillAppear(animated: Bool) {
        collectionView!.reloadData()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        setItemDimension(size)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addMeme") {
            let editorVC = segue.destinationViewController as! MemeEditorViewController
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        
        return appDelegate.memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        let meme = appDelegate.memes[indexPath.row]
        
        let labelAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
            NSStrokeWidthAttributeName : -5,
            ]

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        cell.memeImageView?.image = meme.memedImg
        let topText = NSAttributedString(string: "\(meme.topText.uppercaseString)", attributes: labelAttributes)
        let bottomText = NSAttributedString(string: "\(meme.bottomText.uppercaseString)", attributes: labelAttributes)
        
        cell.topText?.attributedText = topText
        cell.bottomText?.attributedText = bottomText

        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        let meme = appDelegate.memes[indexPath.row]
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = meme
        
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    @IBAction func addMeme(sender: UIBarButtonItem) {
        performSegueWithIdentifier("addMeme", sender: nil)
    }
    


}
