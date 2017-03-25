//
//  PhotoDetailViewController.swift
//  Image
//
//  Created by Jun woo Park on 2017. 3. 24..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    let comment = String()
    let content = String()
    let titleStr = String()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var contentText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentText.text = content
        commentText.text = comment
        titleText.text = titleStr
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
