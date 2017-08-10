//
//  FeedViewController.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit



class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [FeedModelMapper]()
    var selectedIndex = -1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "پیشخوان"
        
        self.tableView.estimatedRowHeight = 68.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.request()
        
    }
    
    // refresh
    @IBAction func refresh(_ sender: Any) {
        self.data.removeAll()
        self.selectedIndex = -1
        self.tableView.reloadData()

        
        
        self.request()
    }
    
    // shared
    @IBAction func share(_ sender: Any) {
        
        let cell: FeedTableViewCell = try(sender as AnyObject).superview!!.superview!.superview as! FeedTableViewCell
        let indexPath = self.tableView.indexPath(for: cell)?.row

        // text to share
        let text = "\(self.data[indexPath!].title!) \r\n\r\n \(self.data[indexPath!].description!)"
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)

    }
    
}
