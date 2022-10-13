//
//  FirstLayoutViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/08.
//

import UIKit
import SnapKit

class FirstLayoutViewController: UIViewController {
    
    private let firstView : UIView =  {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    private let secondView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    
    private func backgroundColor() {
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor()
        layout()

    }

}
    
extension FirstLayoutViewController {
    private func layout() {
        [firstView, secondView].forEach {
            view.addSubview($0)
            }
        
        firstView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(275)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(62)
            make.height.equalTo(155)
            }
        secondView.snp.makeConstraints { make in
            make.top.equalTo(self.firstView.snp.bottom).offset(96)
            make.leading.equalTo(self.firstView)
            make.width.equalTo(109)
            make.height.equalTo(106)
            
        }
    }
    
}


