//
//  MyCollectionViewController.swift
//  CollectionViewMenu
//
//  Created by Gene De Lisa on 4/8/15.
//  Copyright (c) 2015 Gene De Lisa. All rights reserved.
//

import UIKit

let reuseIdentifier = "myViewCell"

class MyCollectionViewController: UICollectionViewController {
    
    var data = ["Foo", "Bar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = UIImage(named: "texture") {
            self.collectionView?.backgroundColor = UIColor(patternImage: image)
        } else {
            self.collectionView?.backgroundColor = UIColor.lightGrayColor()
        }
        
        // Here we add our action(s) to the menu
        var menuItem = UIMenuItem(title: "My Action", action:"myaction:")
        UIMenuController.sharedMenuController().menuItems = [menuItem]
    }
    
    /**
    performAction will call this to do whatever myaction is supposed to do.
    */
    func myaction(sender:AnyObject) {
        println("myaction in vc")
        
        let alertController = UIAlertController(title: "MyAction", message:
            "Invoked my action", preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .Default) {action in
            })
        
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? MyCollectionViewCell {
            
            cell.label.text = data[indexPath.row]
            
            return cell
        }
        
        return MyCollectionViewCell()
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        
        // even though we have the cell choosing the actions, we need this here in the vc.
        return true
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        
        println("performAction in vc \(action) with sender \(sender) ip \(indexPath)")
        
        switch NSStringFromSelector(action) {
        case "myaction:": println("calling myaction")
        myaction(sender!)
            
        case "copy:": println("calling copy")
        case "paste:": println("calling paste")
        default: println("default action")
        }
    }
    
}
