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
    @IBOutlet weak var lineExtend: UIImageView!
    @IBOutlet weak var lineConteiner: UIView!

    
    override func awakeFromNib() {
        // نسبت دادن عکس بگگراند به جداککنده
        //  دلیل این کار نمایش در ابعاد بزرگتر بود که  اگر جداکننده عکس در نظر گرفته میشد در نمایش آی پد کش میومد
        lineConteiner.backgroundColor = UIColor(patternImage: UIImage(named: "arcPatern")!)
        
    }
    
    
}
