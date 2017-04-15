//
//  ViewController.swift
//  GCDTest
//
//  Created by Jun woo Park on 2017. 3. 31..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    
    func beginProgress() {
        let fileContent = try? String.init(contentsOfFile:
            Bundle.main.path(forResource: "bookfile", ofType: "txt")!,
                                           encoding: String.Encoding.utf8)
        var spaceCount = 0
        var progress : Float = 0
        var nIndex = 0
        let father = Float((fileContent?.unicodeScalars.count)!)
        
        //엄청 느리다(반복문 안에서 고차연산은 빼버려라)
        for char in (fileContent?.unicodeScalars)! {
            if char == " ".unicodeScalars.first {
                spaceCount += 1
            }
            
            progress = Float(nIndex) / father
            nIndex += 1
            //main thread는 화면 담당
            
            DispatchQueue.main.async {
                self.progressView.progress = progress
            }
            
        }
        
        let alert = UIAlertController.init(title: "Result",
                                           message: "찾았다. \(spaceCount)개", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func readButtonTouched(_ sender: Any) {
        self.progressView.progress = 0
        
        //시간이 얼마나 걸릴지 모르는 것들은 global thread로 넘기기
        DispatchQueue.global().async {
            self.beginProgress()
        }
        
    }
}

