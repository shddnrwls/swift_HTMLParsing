//
//  ViewController.swift
//  swiftParsingHtml
//
//  Created by mac on 2018. 5. 7..
//  Copyright © 2018년 swift. All rights reserved.
//

import UIKit
import Kanna
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainURL = "https://github.com/trending"
        guard let main = URL(string: mainURL) else {
            print("Error: \(mainURL) doesn't seem to be a valid URL")
            return
        }
        do {
            let lolMain = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: lolMain, encoding: .utf8)
            for product in doc.xpath("//div[@class='explore-content']") {
                if let productURL = product.at_xpath("ol"){
                    
                    if let productURL2 = productURL.at_xpath("li")
                    {
                        if let productURL3 = productURL2.at_xpath("div")
                        {
                            if let trend = productURL3.text, trend.contains("/"){
                                print(trend)
                            }
                            
                        }
//                        print(productURL2.content)
                    }
                }
            }
        } catch let error {
            print("Error: \(error)")
        }
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrapeNYCMetalScene() -> Void {
        
//        Alamofire.request("http://nycmetalscene.com").responseString { response in
//            print("\(response.result.isSuccess)")
//            if let html = response.result.value {
//                self.parseHTML(html: html)
//            }
//        }
    }
    
    @IBAction func parsingHtml(_ sender: UIButton) {
    }

}

