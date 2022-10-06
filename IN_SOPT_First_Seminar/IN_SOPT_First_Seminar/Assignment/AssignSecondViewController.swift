//
//  AssignSecondViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/06.
//

import UIKit

class AssignSecondViewController: UIViewController {
    
    let FirstVC = AssignFirstViewController()
    
    private let secondAccount : UITextField = {
      let account = UITextField(frame: CGRect(x: 25, y: 250, width: 280, height: 100))
       account.placeholder = "이메일 또는 전화번호"
       return account
   }()
    
    private let passWdCheck : UITextField = {
      let passWd = UITextField(frame: CGRect(x: 25, y: 390, width: 280, height: 60))
       passWd.placeholder = "비밀번호 확인"
       return passWd
   }()
   
    private let passWdunderLineView: UIView = {
       let underLine = UIView(frame: CGRect(x: 24, y: 440, width: 342, height: 1))
       underLine.backgroundColor = .systemGray4
       return underLine
   }()
    
    private let secondMakeAccountBtn : UIButton = {
       let makeAccountBtn = UIButton(frame: CGRect(x: 25, y: 465, width: 342, height: 45))
       makeAccountBtn.layer.cornerRadius = 5
       makeAccountBtn.backgroundColor = .systemGray6
       makeAccountBtn.setTitle("새로운 카카오계정 만들기", for: .normal)
       makeAccountBtn.setTitleColor(.black, for: .normal)
       makeAccountBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        makeAccountBtn.addTarget(self, action: #selector(touchupMakeAccount2), for: .touchUpInside)
       return makeAccountBtn
   }()
    
    private func assignPresentToThirdVC() {
        let thirdVC = AssignThirdViewController()
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
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let components : [Any] = [FirstVC.kakaoTitle,secondAccount, FirstVC.underLineView, FirstVC.passWd, FirstVC.underLineView2, passWdCheck,passWdunderLineView, secondMakeAccountBtn]
        components.forEach{
            view.addSubview($0 as! UIView)

        }
        
        // Do any additional setup after loading the view.
    }
    



}
