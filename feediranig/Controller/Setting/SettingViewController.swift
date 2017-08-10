//
//  SettingViewController.swift
//  feediranig
//
//  Created by amin on 5/19/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var data = [ModelSetting]()
    var category = [Int]()
    let categoryKey = "category"
    
    @IBOutlet weak var feedPage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        category = Coredata().readCategory(key: categoryKey)
        
        self.title = "تنظیمات"
        
        let d1 = ModelSetting()
        d1.id = 1; d1.title = "ورزشی"
        self.data.append(d1)
        
        let d2 = ModelSetting()
        d2.id = 2; d2.title = "سیاسی"
        self.data.append(d2)
        
        let d3 = ModelSetting()
        d3.id = 3; d3.title = "عمومی"
        self.data.append(d3)
        
        let d4 = ModelSetting()
        d4.id = 4; d4.title = "بین‌المللی"
        self.data.append(d4)
        
        let d5 = ModelSetting()
        d5.id = 5; d5.title = "تکنولوژی"
        self.data.append(d5)
        
        let d6 = ModelSetting()
        d6.id = 6; d6.title = "اقتصادی"
        self.data.append(d6)
    
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(mainFeed(tapGestureRecognizer:)))
        self.feedPage.addGestureRecognizer(tap)

    }
    
    func mainFeed(tapGestureRecognizer: UITapGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidDisappear(_ animated: Bool) {
        Coredata().save(value: self.category, key: categoryKey)
    }


}


