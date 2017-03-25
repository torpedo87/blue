//
//  DetailViewController.swift
//  camClient
//
//  Created by Jun woo Park on 2017. 3. 24..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var detailImageView: UIImageView!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        let task = URLSession(configuration: URLSessionConfiguration.default).streamTask(withHostName: "127.0.0.1", port: 8000)
        task.resume()
        

        task.readData(ofMinLength: 0, maxLength: 8, timeout: 0) { (data, bool, error) in
            //data를 인코딩하기
            var recievedStr = String(data: data!, encoding: String.Encoding.utf8)
            print(recievedStr!)
            
            task.readData(ofMinLength: 0, maxLength: Int.init(recievedStr!)!, timeout: 0) { (data, bool, error) in
                //data를 인코딩하기
                self.detailImageView.image = UIImage(data: data!)
            }

        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

