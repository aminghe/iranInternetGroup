//
//  tableViewFeedViewController.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import UIKit
extension FeedViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // سلول جدید کلیک شد - سلول قبلی به صورت پیش فرض نمایش در آید
        if(indexPathOld != -1){
            let _indexpath = IndexPath(row: indexPathOld, section: 0)
            let currentCell = self.tableView.cellForRow(at: _indexpath)
            if(currentCell != nil){
                let cell = currentCell as! FeedTableViewCell
                cell.lineExtend.image = UIImage(named: "arc")
                cell.lineConteiner.backgroundColor = UIColor(patternImage: UIImage(named: "arcPatern")!)
            }
        }

        
        var extend = "arc"
        //کلیک روی سلول
        if(selectedIndex == indexPath.row){
            // کلیک روی خود سلول و بسته شدن
            selectedIndex = -1
            indexPathOld = -1
        }else{
            // کلیک روی سلول دیگر
            indexPathOld = indexPath.row
            selectedIndex = indexPath.row
            extend = "arcExtend"
        }
        
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
        
        //تغییر نمایش خط جداکننده سلول ها
        let currentCell = self.tableView.cellForRow(at: indexPath) as! FeedTableViewCell
        currentCell.lineExtend.image = UIImage(named: extend)
        currentCell.lineConteiner.backgroundColor = UIColor(patternImage: UIImage(named: "\(extend)Patern")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(selectedIndex == indexPath.row){
            // محاسبه طول توضیحات مربوط به خبر
            // ۴۲ به طول دکمه نمایش خبر برمیگردد
            // ۱۴۵ به اندازه باکس نمایش داده شده برمیگردد.
            var heightView = CGFloat(42)
            let currentCell = self.tableView.cellForRow(at: indexPath)
            if(self.data[indexPath.row].height != 0.0){
                
                return 145 + self.data[indexPath.row].height
                //set new Image
            }
            if(currentCell != nil){
                let cell = currentCell as! FeedTableViewCell
                heightView += cell.desc.frame.size.height
                self.data[indexPath.row].height = heightView
            }
            return 145 + heightView
        }
        return 145
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        let index = (indexPath as NSIndexPath).row
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.Img.downoadImage(ImageUrl: self.data[index].imageUrl!)
        cell.desc.text = self.data[index].description
        cell.Title.text = self.data[index].title
        cell.Date.text = self.data[index].time?.toDate()
        cell.lineExtend.image = UIImage(named: "arc")
        cell.lineConteiner.backgroundColor = UIColor(patternImage: UIImage(named: "arcPatern")!)
        return cell
    }
    
}
