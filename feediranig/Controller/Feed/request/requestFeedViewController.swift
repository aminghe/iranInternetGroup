//
//  requestFeedViewController.swift
//  feediranig
//
//  Created by amin on 5/18/1396 AP.
//  Copyright © 1396 iranig. All rights reserved.
//

import AlamofireObjectMapper
import Alamofire

extension FeedViewController {
    func request(){
        guard network().isConnectedToNetwork() == true else {
            Message.show(message: " اتصال اینترنت خود را چک نمایید", type: .error)
            return
        }
        Indicator.show()
        let URL = Urls().news()
        Alamofire.request(URL).responseArray { (response: DataResponse<[FeedModelMapper]>) in
            Indicator.hide()
            do {
                print(response)
                self.data = try response.result.value!
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }catch {
                print("error")
            }
        }
    }
}
