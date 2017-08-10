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
        
        var extend = "line"
        if(selectedIndex == indexPath.row){
            selectedIndex = -1
        }else{
            selectedIndex = indexPath.row
            extend = "lineExtend"
        }
        
        
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
        
        let currentCell = self.tableView.cellForRow(at: indexPath) as! FeedTableViewCell
        currentCell.lineExtend.image = UIImage(named: extend)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(selectedIndex == indexPath.row){
            
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
        cell.lineExtend.image = UIImage(named: "line")

        return cell
        
    }
    
}
