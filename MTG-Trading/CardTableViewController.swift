//
//  ViewController.swift
//  MTG-Trading
//
//  Created by Daniel Huber on 4/16/18.
//  Copyright © 2018 Daniel Huber. All rights reserved.
//

import UIKit
import Foundation

class CardTableViewController: UIViewController {

    @IBOutlet var cardNameText: UITextField!
    @IBOutlet var cardTable: UITableView!
    @IBOutlet var cardCell: CardTableViewCell!
    var globalError: Error
    var globalResponse: HTTPURLResponse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getCardJson(group: String) {
        bearerToken = "4xWw41MfmlCGFAJsXYlfY2w_ejD525Jl5t_nETpdoC7k_UR3q3I2TbdgEMnQPAJIH1l_PlzgwDuF7lYKQ28ds1vtuwDjyXgSLN4VKAwTPDe7UHwnYXIu5_075l6JigaiOH2CI4KJj-AXb1TTo-4mH2o0wph0FaLiDCYkQ0FJ0_DXMzh14AS8cuQWlFaCvh6kFzkKL_M9JqwLQRkCZ_DvXd9jy7TvvRMYr4ygzS2aQ3t2848-nWZOQDGjqtPOFpzNjeMF3CCbFNsRGCER0O-xqXPbfqx7i2jeCUWoAO-alwdFtcr-jsKXXI5VCR9lYC4NitR-zw"
        
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer " + bearerToken,
            "Cache-Control": "no-cache",
            "Postman-Token": "a3a2e34e-ee12-47c5-ab6d-7893e5017c8d"
        ]
        var url: String = "http://api.tcgplayer.com/v1.6.0/catalog/products?categoryId=1&getExtendedFields=true&groupName=" + group + "&productTypes=Cards"
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
                self.globalError = error!
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                self.globalResponse = httpResponse!
            }
        })
        
        dataTask.resume()
    }

}

