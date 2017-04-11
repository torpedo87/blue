//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Jun woo Park on 2017. 4. 2..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //스크롤 뷰를 아울렛에 연결
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //frame 값을 측정할 때 viewdidload에서는 안나오므로 이 함수로 측정 가능
    //scrollview가 전체화면이 아닐경우
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollView.frame.size.width
        
        //이미지들을 이미지뷰에 넣고 이 이미지뷰를 배열에 넣는다
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            //오른쪽으로 한 화면씩 이동
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            contentWidth += newX
            
            //스크롤뷰에 이미지뷰 넣기
            scrollView.addSubview(imageView)
            
            //이미지뷰 위치 지정
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        //스크롤뷰의 사이즈 지정
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        //scrollView.backgroundColor = UIColor.purple
        
        //스크롤되는 내용이 스크롤뷰 밖에서도 보여지게
        scrollView.clipsToBounds = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

