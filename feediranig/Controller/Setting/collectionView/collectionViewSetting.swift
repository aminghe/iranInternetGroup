//
//  SettingViewController
//  feediranig
//
//  Created by amin on 5/19/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit

extension SettingViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! cellCollectionViewSetting
        let index = indexPath.row
        let id = self.data[indexPath.row].id
        let location = self.category.index(of: id!)
        // در صورت انتخاب شدن از قبل دکمه مورد نطر به صورت انتخاب در می آید
        if(location != nil){
            // exist
            cell.category.backgroundColor = UIColor.init(rgb: 0x828789)
            cell.category.textColor = UIColor.init(rgb: 0xffffff)
        }
        cell.category.text = self.data[index].title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = self.collectionView.cellForItem(at: indexPath) as! cellCollectionViewSetting
        
        // زمانی که روی دکمه های دسته بندی کلیک کرد بر اساس رنگ تشخیص داده میشود که کلیک خورده یا نه و داخل آرایه ذخیره و یا حذف میشود
        if(currentCell.category.backgroundColor == UIColor.init(rgb: 0x828789)){
            let id = self.data[indexPath.row].id
            let location = self.category.index(of: id!)
            self.category.remove(at: location!)
            currentCell.category.backgroundColor = UIColor.white
            currentCell.category.textColor = UIColor.init(rgb: 0x828789)
        }else{
            self.category.append(self.data[indexPath.row].id!)
            currentCell.category.backgroundColor = UIColor.init(rgb: 0x828789)
            currentCell.category.textColor = UIColor.init(rgb: 0xffffff)
        }
    }
}
