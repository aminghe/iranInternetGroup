//
//  FeedTableViewCell.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit
class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CountView: UILabel!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var containerdes: UIView!
    
    @IBOutlet weak var ContainerHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lineExtend: UIImageView!
    
    var showsDetail = false {
        didSet {
            self.ContainerHeightConstraint.priority = showsDetail ? 250 : 999
        }
    }
}
