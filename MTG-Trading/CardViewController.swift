//
//  CardViewController.swift
//  MTG-Trading
//
//  Created by Daniel Huber on 7/7/18.
//  Copyright © 2018 Daniel Huber. All rights reserved.
//

import UIKit
import Foundation

class CardViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardCMC: UILabel!
    @IBOutlet weak var cardTypes: UILabel!
    @IBOutlet weak var cardText: UILabel!
    
    var card: Card?
    var globalError: Error?
    var globalResponse: HTTPURLResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (card != nil) {
            loadCard(card: card!)
        }
        getCardJson(group: "Battlebond")
//        if (globalResponse != nil) {
//            let json = parseJson(json: globalResponse!)
//            print(json)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadCard(card: Card) {
        
    }
    
    private func getCardJson(group: String) {
        var bearerToken = "4xWw41MfmlCGFAJsXYlfY2w_ejD525Jl5t_nETpdoC7k_UR3q3I2TbdgEMnQPAJIH1l_PlzgwDuF7lYKQ28ds1vtuwDjyXgSLN4VKAwTPDe7UHwnYXIu5_075l6JigaiOH2CI4KJj-AXb1TTo-4mH2o0wph0FaLiDCYkQ0FJ0_DXMzh14AS8cuQWlFaCvh6kFzkKL_M9JqwLQRkCZ_DvXd9jy7TvvRMYr4ygzS2aQ3t2848-nWZOQDGjqtPOFpzNjeMF3CCbFNsRGCER0O-xqXPbfqx7i2jeCUWoAO-alwdFtcr-jsKXXI5VCR9lYC4NitR-zw"
        
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer " + bearerToken,
            "Cache-Control": "no-cache",
            "Postman-Token": "a3a2e34e-ee12-47c5-ab6d-7893e5017c8d"
        ]
        var url: String = "https://api.tcgplayer.com/v1.6.0/catalog/products?categoryId=1&getExtendedFields=true&groupName=" + group + "&productTypes=Cards"
        
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
    
    private func parseJson(json: HTTPURLResponse) -> String {
        if let dictionary = json as? [String: Any] {
            if let extendedFields = dictionary["extendedData"] {
                
            }
        }
        return ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
