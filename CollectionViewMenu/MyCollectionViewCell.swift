//
//  MyCollectionViewCell.swift
//  CollectionViewMenu
//
//  Created by Gene De Lisa on 4/8/15.
//  Copyright (c) 2015 Gene De Lisa. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var label: UILabel!
    
    // MARK: - Menu
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {

        // this is where you choose the ones you want to appear
        switch NSStringFromSelector(action) {
        case "myaction:": return true
        case "copy:": return true
        case "paste:": return true
            // here are some of the standard actions
        case "cut:": return false
        case "select:": return false
        case "selectAll:": return false
        case "delete:": return false
            // there are more, so just say no
        default: return false
        }
    }
    
    /**
    Need this for custom action. You don't need it for the built in actions like cut, copy, and paste.
    the sender is the UIMenuController.
    */
    func myaction(sender:AnyObject) {
        if let cv = self.superview as? UICollectionView {
            if let d = cv.delegate {
                if d.respondsToSelector("collectionView:performAction:forItemAtIndexPath:withSender:") {
                    println("it responds")
                    if let indexpath = cv.indexPathForCell(self) {
                        d.collectionView!(cv,
                            performAction: "myaction:",
                            forItemAtIndexPath: indexpath,
                            withSender: self) // this can be the cell (self) or the sender (UIMenuController)
                    }
                }
            }
        }
    }
    
}
