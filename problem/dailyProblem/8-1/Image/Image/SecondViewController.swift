//
//  SecondViewController.swift
//  Image
//
//  Created by Jun woo Park on 2017. 3. 23..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func random(_ sender: Any) {
        //randomJSON()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jsonData = "[{\"title\":\"\u{c0c8}\u{b85c}\",\"image\":\"01.jpg\", \"content\":\"\u{c601}\u{d654}\u{bcf4}\u{b7ec}\u{ac00}\u{c790}\",\"comments\": [{\"id\":1,\"user\":\"jobs\",\"comment\":\"apple\"},{\"id\":4,\"user\":\"cook\", \"comment\":\"apple\"}]}, {\"title\":\"\u{d1a0}\u{c774}\u{c2a4}\u{d1a0}\u{b9ac} \",\"image\":\"02.jpg\", \"content\":\"Pixar\",\"comments\":[]}, {\"title\": \"ToyStory\",\"image\":\"03.jpg\",\"content\":\"\u{c6b0}\u{b514}\u{ac00} \u{cd5c}\u{ace0}\",\"comments\":[{\"id\":2,\"user\":\"bill\",\"comment\": \"Microsoft\"}]}, {\"title\":\"\u{adf9}\u{c7a5}\u{c740}\",\"image\":\"04.jpg\", \"content\":\"\u{c5b4}\u{b514}\u{b85c}\",\"comments\":[{\"id\":4,\"user\": \"cook\",\"comment\":\"apple\"}]}]".data(using: .utf8)
        
     //jasondata를 시리얼화해서 var jasonArray: Array<Dictionary<String, Any>로 저장해라
        
        //jsonData로부터 값 추출하기
        //데이터 형식을 스위프트가 읽을 수 있도록 파싱하기
        let json = try? JSONSerialization.jsonObject(with: jsonData!, options: [])
        let imageView = self.storyboard?.instantiateViewController(withIdentifier: "photoView") as! PhotoDetailViewController
        
        //타입캐스팅
        if let array = json as? [[String: Any]] {
            
            let randomElement = array[Int(arc4random(4))]
            if let title = randomElement["title"] as? String {
                title =
            }
            
            if let image = randomElement["image"] as? String {
                
            }
            
            
//            if let number = dictionary["someKey"] as? Double {
//                // access individual value in dictionary
//            }
//            
//            for (key, value) in dictionary {
//                // access all key / value pairs in dictionary
//            }
//            
//            if let nestedDictionary = dictionary["anotherKey"] as? [String: Any] {
//                // access nested dictionary values by key
//            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

