//
//  ThirdLayoutViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/08.
//

import UIKit
import SnapKit

class ScrollLayoutViewController : UIViewController {
    
    private lazy var containerView = UIScrollView()
    
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        config()
        layout()
        // Do any additional setup after loading the view.
    }

}

extension ScrollLayoutViewController {
    private func layout() {
        view.addSubview(containerView)
        [firstView, secondView, thirdView].forEach {
            containerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        firstView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(337)
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(self.firstView.snp.bottom).offset(45)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(337)
        
        }
        thirdView.snp.makeConstraints{make in
            make.top.equalTo(self.secondView.snp.bottom).offset(45)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(337)
            make.bottom.equalToSuperview().offset(-45)  //중요!!!!
            
        }
    }
    
    private func config() {
        firstView.backgroundColor = .systemGray3
        secondView.backgroundColor = .systemRed
        thirdView.backgroundColor = .systemPink
    }
}
