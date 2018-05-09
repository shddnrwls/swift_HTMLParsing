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
    var array = Array<String>()
    var stararray = Array<String>()
    var contentarray = Array<String>()
    
    
    
    @IBOutlet var testBtn: UIButton!
    @IBOutlet var testLbl: UILabel!
    
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
                        
                        for a in productURL.xpath("li"){
                            if let star = a.at_xpath("div[@class = 'f6 text-gray mt-2']"){
                                if let star2 = star.at_xpath("a"){
                                    if let star3 = star2.text , star3.contains("\n"){
                                        let star4 = star3.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                        stararray.append(star4)
                                    }
                                }
                                
                            }
                            if let con = a.at_xpath("div[@class = 'py-1']"){
                                if let conn = con.at_xpath("p"){
                                    let connn = conn.text?.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                    contentarray.append(connn!)
                                    print(connn)
                                    
                                    
                                }
                               
                            }
                            if let pr = a.at_xpath("div"){
                                
                                if let se = pr.text, se.contains("/"){
                                    let tri = se.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                    
                                    array.append(tri)
//                                    print(array)
                                    
                                }
                            }
                            
                        }
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
        print(array[1])
        print(stararray[1])
        print(contentarray[1])
        testLbl.text = array[0]
        
    }

}

