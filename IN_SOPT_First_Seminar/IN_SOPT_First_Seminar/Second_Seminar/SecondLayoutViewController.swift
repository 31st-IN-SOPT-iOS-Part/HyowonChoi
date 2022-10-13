//
//  SecondLayoutViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/08.
//

import UIKit
import SnapKit

class SecondLayoutViewController: UIViewController {
    
    private let firstView : UIView =  {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let secondView : UIView =  {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let thirdView : UIView =  {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let fourthView : UIView =  {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let fifthView : UIView =  {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        layout()
    }
}

extension SecondLayoutViewController {
    private func layout() {
        let  width = UIScreen.main.bounds.width
        [firstView, secondView, thirdView,fourthView,fifthView].forEach {
            view.addSubview($0)
        }
        
        firstView.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(149)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(70)
            make.height.equalTo(152)
        }
        
        secondView.snp.makeConstraints{ make in
            make.top.equalTo(self.firstView.snp.bottom).offset(23)
            make.leading.equalTo(self.firstView)
            make.trailing.equalTo(self.firstView.snp.centerX).offset(-2.5)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-191)
        }
        
        thirdView.snp.makeConstraints { make in
            make.top.equalTo(self.secondView)
            make.leading.equalTo(self.secondView.snp.trailing).offset(2.5)
            make.trailing.equalTo(self.firstView)
            make.height.equalTo(32)
        }
        
        fourthView.snp.makeConstraints { make in
            make.top.equalTo(self.thirdView.snp.bottom).offset(5)
            make.leading.trailing.equalTo(self.thirdView)
            make.height.equalTo(34)
        }
        fifthView.snp.makeConstraints { make in
            make.top.equalTo(self.fourthView.snp.bottom).offset(5)
            make.leading.trailing.equalTo(self.thirdView)
            make.bottom.equalTo(self.secondView)
        }
    }
}
