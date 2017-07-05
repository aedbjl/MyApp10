//
//  ViewController.swift
//  MyApp10
//
//  Created by iii-user on 2017/6/27.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func getJSON(_ sender: Any) {
        do {
            let url = URL(string: "http://data.coa.gov.tw/Service/RedirectService.aspx?UnitId=633&url=http%3a%2f%2fdata.coa.gov.tw%2fservice%2fopendata%2fagrstatUnit.aspx%3fitem_code%3d244201070240%26dimension_code%3d%24QA01TOTAL%26dimension_group_code_1%3dQA03")
            let data = try Data(contentsOf: url!)
            let source = try String(contentsOf: url! ,encoding: String.Encoding.utf8)
            print(source)
            parseJSON(json: data)
        }catch{
            print("okoko")
            //處理try的錯誤
            print(error)
            
            
        }

    }
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textPasswd: UITextField!
    @IBOutlet weak var textAccount: UITextField!
    @IBAction func testGet(_ sender: Any) {
        do {
            
            let account = textAccount.text;
            let passwd = textPasswd.text ;
            let urlString = "http://127.0.0.1/44444.php?account=\(account!)&passwd=\(passwd!)";
            
            let url = URL(string: urlString)
            let source = try String(contentsOf: url! ,encoding: String.Encoding.ascii)
            
            if source == "OK"{
                print("add ok")
            }else {
                print("XX")
            }
            
            
           
        }catch{
            print("okoko")
            //處理try的錯誤
            print(error)
            
        }

        
    }
    @IBAction func btnimageView(_ sender: Any) {
       
        
        DispatchQueue.global().async {
            self.fetchImage()
        }
        
        
//        do {
//            let url = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/1200px-Google_2015_logo.svg.png")
//            if url != nil {
//                let data = try Data(contentsOf: url!)
//                let img = UIImage(data: data)
//                imageView.image = img
//            }else{
//                let img2 = UIImage(named:"user.png")
//                imageView.image = img2
//            }
//        } catch {
//            let img2 = UIImage(named:"user.png")
//            imageView.image = img2
//        }
    }
    
    private func parseJSON(json: Data){
        do{
            if let jsonObj = try? JSONSerialization.jsonObject(with: json, options: .allowFragments){
//                print(type(of:jsonObj))
                let allObj = jsonObj as! [[String:AnyObject]]
                
                for r in allObj {
                    print(r["dname2"] as! String)
                }
            }
        }catch{
            print(error)
        }
    }
    
    
    private func fetchImage (){
        do {
            let url = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/1200px-Google_2015_logo.svg.png")
            if url != nil {
                let data = try Data(contentsOf: url!)
                let img = UIImage(data: data)
                DispatchQueue.main.async{
                 self.imageView.image = img
                }
            }else{
                let img2 = UIImage(named:"user.png")
                DispatchQueue.main.async{
                    self.imageView.image = img2
                }
            }
        } catch {
            let img2 = UIImage(named:"user.png")
            DispatchQueue.main.async{
                self.imageView.image = img2
            }
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        do {
            let url = URL(string: "http://www.google.com/")
            let source = try String(contentsOf: url! ,encoding: String.Encoding.ascii)
            print(source)
        }catch{
            print("okoko")
            //處理try的錯誤
            print(error)
            
        }
    }

    

}

