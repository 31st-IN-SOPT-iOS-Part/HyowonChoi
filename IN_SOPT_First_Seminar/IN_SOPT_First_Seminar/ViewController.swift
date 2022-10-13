//
//  ViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/01.
//

import UIKit

class ViewController: UIViewController {

    private let testLabel : UILabel = {
        //x,y => 원점 지정, 그리기 시작 / width,height => 그려지는 면적
        let label = UILabel(frame: CGRect(x: 100, y: 400, width: 300, height: 100))
               label.text = "아요미들🍎" //ctrl+cmd+space => 이모티콘
               label.font = .boldSystemFont(ofSize: 40)
               return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white  //원래 view는 초기화 상태여서 아무것도 안보임
        view.addSubview(testLabel)
    }


}

