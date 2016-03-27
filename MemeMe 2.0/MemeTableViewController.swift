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

        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell", forIndexPath: indexPath) as! MemeTableViewCell
        cell.memeText?.text = (meme.topText + "..." + meme.bottomText).uppercaseString
        cell.memeImageView?.image = meme.memedImg

        return cell
    }

    
}
