//
//  AssignSecondViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/06.
//

import UIKit
import SnapKit

class KakaoSignupViewController: UIViewController {
    
    let FirstVC = KakaoLoginViewController()
    
    private let secondKakaoTitle : UILabel =  {
       let title = UILabel()
       title.text = "카카오톡을 시작합니다"
       title.font = .systemFont(ofSize: 23, weight: .medium)
       return title
   }()
    
    private let secondAccount : UITextField = {
      let account = UITextField()
       account.placeholder = "이메일 또는 전화번호"
       return account
   }()
    
    private let accountUnderLineView: UIView = {
       let underLine = UIView()
       underLine.backgroundColor = .systemGray4
       return underLine
   }()
    
    private let secondPassWd : UITextField = {
      let passWd = UITextField()
       passWd.placeholder = "비밀번호"
       return passWd
   }()
    
    private let passWdUnderLineView: UIView = {
       let underLine = UIView()
       underLine.backgroundColor = .systemGray4
       return underLine
   }()
    
    private let PassWdCheck : UITextField = {
      let passWd = UITextField()
       passWd.placeholder = "비밀번호 확인"
       return passWd
   }()
   
    private let passWdCheckUnderLineView: UIView = {
       let underLine = UIView()
       underLine.backgroundColor = .systemGray4
       return underLine
   }()
    
    private let secondMakeAccountBtn : UIButton = {
       let makeAccountBtn = UIButton()
       makeAccountBtn.layer.cornerRadius = 5
       makeAccountBtn.backgroundColor = .systemGray6
       makeAccountBtn.setTitle("새로운 카카오계정 만들기", for: .normal)
       makeAccountBtn.setTitleColor(.black, for: .normal)
       makeAccountBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        makeAccountBtn.addTarget(self, action: #selector(touchupMakeAccount2), for: .touchUpInside)
       return makeAccountBtn
   }()
    
    private func assignPresentToThirdVC() {
        let thirdVC = KakaoWelcomeViewController()
        thirdVC.modalPresentationStyle = .fullScreen
        if let account = secondAccount.text {
            thirdVC.dataBind(result: account)
        }
        self.present(thirdVC, animated: true, completion: nil)
    }
    
    @objc
    private func touchupMakeAccount2() {
        assignPresentToThirdVC()
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        layout()
    }
}

extension KakaoSignupViewController {
    private func layout() {
        [secondKakaoTitle, secondAccount, accountUnderLineView, secondPassWd, passWdUnderLineView, PassWdCheck, passWdCheckUnderLineView, secondMakeAccountBtn].forEach{
            view.addSubview($0)
        }
        
        secondKakaoTitle.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(25)
        }
        secondAccount.snp.makeConstraints{ make in
            make.top.equalTo(self.secondKakaoTitle.snp.bottom).offset(116)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(333)
            make.height.equalTo(49)
        }
        accountUnderLineView.snp.makeConstraints{ make in
            make.top.equalTo(self.secondAccount.snp.bottom)
            make.centerX.equalTo(self.secondAccount.snp.centerX)
            make.width.equalTo(self.secondAccount)
            make.height.equalTo(0.5)
        }
        secondPassWd.snp.makeConstraints{ make in
            make.top.equalTo(self.accountUnderLineView.snp.bottom).offset(10)
            make.centerX.equalTo(self.secondAccount.snp.centerX)
            make.width.equalTo(self.secondAccount)
            make.height.equalTo(self.secondAccount)
        }
        passWdUnderLineView.snp.makeConstraints{ make in
            make.top.equalTo(self.secondPassWd.snp.bottom)
            make.centerX.equalTo(self.secondPassWd.snp.centerX)
            make.width.equalTo(self.secondPassWd)
            make.height.equalTo(0.5)
        }
        PassWdCheck.snp.makeConstraints{ make in
            make.top.equalTo(self.passWdUnderLineView.snp.bottom).offset(10)
            make.centerX.equalTo(self.secondAccount.snp.centerX)
            make.width.equalTo(self.secondAccount)
            make.height.equalTo(self.secondAccount)
        }
        passWdCheckUnderLineView.snp.makeConstraints{ make in
            make.top.equalTo(self.PassWdCheck.snp.bottom)
            make.centerX.equalTo(self.PassWdCheck.snp.centerX)
            make.width.equalTo(self.PassWdCheck)
            make.height.equalTo(0.5)
        }
        secondMakeAccountBtn.snp.makeConstraints { make in
            make.top.equalTo(self.passWdCheckUnderLineView.snp.bottom).offset(26)
            make.centerX.equalTo(self.secondAccount.snp.centerX)
            make.width.equalTo(self.secondAccount)
            make.height.equalTo(44)
        }
    }
}
