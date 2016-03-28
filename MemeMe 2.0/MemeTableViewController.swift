//
//  MemeTableViewController.swift
//  MemeMe 2.0
//
//  Created by Feng Zhu on 3/25/16.
//  Copyright © 2016 Feng Zhu. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
  override func viewDidLoad() {
        super.viewDidLoad()
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView!.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if (segue.identifier == "addMeme") {
            let editorVC = segue.destinationViewController as! MemeEditorViewController
        }
    }
    
    @IBAction func addMeme(sender: UIBarButtonItem) {
        performSegueWithIdentifier("addMeme", sender: nil)
    }
 
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate

        return appDelegate.memes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        let meme = appDelegate.memes[indexPath.row]

        let labelAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
            NSStrokeWidthAttributeName : -5,
            ]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell", forIndexPath: indexPath) as! MemeTableViewCell
        cell.memeText?.text = (meme.topText + "..." + meme.bottomText).uppercaseString
        cell.memeImageView?.image = meme.memedImg
        
        let topText = NSAttributedString(string: "\(meme.topText.uppercaseString)", attributes: labelAttributes)
        let bottomText = NSAttributedString(string: "\(meme.bottomText.uppercaseString)", attributes: labelAttributes)

        cell.topText?.attributedText = topText
        cell.bottomText?.attributedText = bottomText

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        let meme = appDelegate.memes[indexPath.row]
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = meme
        
        self.navigationController!.pushViewController(detailController, animated: true)

    }
    
}
