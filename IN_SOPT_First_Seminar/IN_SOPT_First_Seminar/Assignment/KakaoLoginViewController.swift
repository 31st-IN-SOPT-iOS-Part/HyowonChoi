//
//  AssignFirstViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/06.
//

import UIKit
import SnapKit

class KakaoLoginViewController: UIViewController {
    
     let kakaoTitle : UILabel =  {
        let title = UILabel()
        title.text = "카카오톡을 시작합니다"
        title.font = .systemFont(ofSize: 23, weight: .medium)
        return title 
    }()
    
    private let subTitle : UILabel = {
        let subTitle = UILabel()
        subTitle.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        subTitle.textAlignment = .center    //가운데 정렬
        //줄바꿈
        subTitle.numberOfLines = 0
        subTitle.lineBreakMode = .byWordWrapping
        subTitle.font = .systemFont(ofSize: 15, weight: .light)
        subTitle.textColor = .gray
        return subTitle
    }()
    
     let account : UITextField = {
       let account = UITextField()
        account.placeholder = "이메일 또는 전화번호"
        
        return account
    }()
    
    
     let underLineView: UIView = {
        let underLine = UIView()
        underLine.backgroundColor = .systemGray4
        return underLine
    }()
    
     let passWd : UITextField = {
       let passWd = UITextField()
        passWd.placeholder = "비밀번호"
        return passWd
    }()
    
     let underLineView2: UIView = {
        let underLine = UIView()
        underLine.backgroundColor = .systemGray4
        return underLine
    }()
    
    private let loginBtn : UIButton = {
        let loginBtn = UIButton()
        loginBtn.layer.cornerRadius = 5 //버튼 모서리 둥글게
        loginBtn.backgroundColor = .systemGray6
        loginBtn.setTitle("카카오계정 로그인", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)  //버튼 타이틀 크기 조절
        loginBtn.addTarget(self, action: #selector(touchupLogin), for: .touchUpInside)
        return loginBtn
    }()
    
     let makeAccountBtn : UIButton = {
        let makeAccountBtn = UIButton()
        makeAccountBtn.layer.cornerRadius = 5
        makeAccountBtn.backgroundColor = .systemGray6
        makeAccountBtn.setTitle("새로운 카카오계정 만들기", for: .normal)
        makeAccountBtn.setTitleColor(.black, for: .normal)
        makeAccountBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
         makeAccountBtn.addTarget(self, action: #selector(touchupMakeAccount), for: .touchUpInside)
        return makeAccountBtn
    }()
    
    private let findLabel : UILabel = {
       let findLabel = UILabel()
        findLabel.text = "카카오계정 또는 비밀번호 찾기"
        findLabel.font = .systemFont(ofSize: 13, weight: .medium)
        findLabel.textAlignment = .center
        return findLabel
    }()
    
    private func assignPushToSecondVC () {
        let secondVC = KakaoSignupViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    private func assignPresentToThirdVC() {
        let thirdVC = KakaoWelcomeViewController()
        thirdVC.modalPresentationStyle = .fullScreen
        guard let account = account.text else { return }
        thirdVC.dataBind(result: account)
        self.present(thirdVC, animated: true, completion: nil)
    }
    
    @objc
    private func touchupMakeAccount() {
        assignPushToSecondVC()
    }
    
    @objc
    private func touchupLogin() {
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

extension KakaoLoginViewController {
    private func layout() {
        [kakaoTitle, subTitle, account, underLineView, passWd, underLineView2, loginBtn, makeAccountBtn, findLabel].forEach{
            view.addSubview($0)
        }
        
        kakaoTitle.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(25)
        }
        subTitle.snp.makeConstraints{ make in
            make.top.equalTo(self.kakaoTitle.snp.bottom).offset(20)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(50)
            
        }
        account.snp.makeConstraints{ make in
            make.top.equalTo(self.subTitle.snp.bottom).offset(42)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(333)
            make.height.equalTo(49)
        }
        underLineView.snp.makeConstraints{ make in
            make.top.equalTo(self.account.snp.bottom)
            make.centerX.equalTo(self.account.snp.centerX)
            make.width.equalTo(self.account)
            make.height.equalTo(0.5)
            
        }
        passWd.snp.makeConstraints{ make in
            make.top.equalTo(self.underLineView.snp.bottom).offset(10)
            make.centerX.equalTo(self.account.snp.centerX)
            make.width.equalTo(self.account)
            make.height.equalTo(self.account)
        }
        underLineView2.snp.makeConstraints{ make in
            make.top.equalTo(self.passWd.snp.bottom)
            make.centerX.equalTo(self.passWd.snp.centerX)
            make.width.equalTo(self.passWd)
            make.height.equalTo(0.5)
        }
        loginBtn.snp.makeConstraints{ make in
            make.top.equalTo(self.underLineView2.snp.bottom).offset(35)
            make.centerX.equalTo(self.account.snp.centerX)
            make.width.equalTo(self.account)
            make.height.equalTo(44)
        }
        makeAccountBtn.snp.makeConstraints{ make in
            make.top.equalTo(self.loginBtn.snp.bottom).offset(10)
            make.centerX.equalTo(self.account.snp.centerX)
            make.width.equalTo(self.account)
            make.height.equalTo(44)
        }
        findLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.makeAccountBtn.snp.bottom).offset(15)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(99)
            make.height.equalTo(29)

        }

    }
}
