//
//  AssignFirstViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/06.
//

import UIKit

class AssignFirstViewController: UIViewController {
    
     let kakaoTitle : UILabel =  {
        let title = UILabel(frame: CGRect(x: 95, y: 110, width: 250, height: 30))
        title.text = "카카오톡을 시작합니다"
        title.font = .systemFont(ofSize: 23, weight: .medium)
        return title 
    }()
    
    private let subTitle : UILabel = {
        let subTitle = UILabel(frame: CGRect(x: 60, y: 140, width: 270, height: 100))
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
       let account = UITextField(frame: CGRect(x: 25, y: 250, width: 280, height: 100))
        account.placeholder = "이메일 또는 전화번호"
        
        return account
    }()
    
    
     let underLineView: UIView = {
        let underLine = UIView(frame: CGRect(x: 24, y: 320, width: 342, height: 1))
        underLine.backgroundColor = .systemGray4
        return underLine
    }()
    
     let passWd : UITextField = {
       let passWd = UITextField(frame: CGRect(x: 25, y: 330, width: 280, height: 60))
        passWd.placeholder = "비밀번호"
        return passWd
    }()
    
     let underLineView2: UIView = {
        let underLine = UIView(frame: CGRect(x: 24, y: 380, width: 342, height: 1))
        underLine.backgroundColor = .systemGray4
        return underLine
    }()
    
    private let loginBtn : UIButton = {
        let loginBtn = UIButton(frame: CGRect(x: 25, y: 410, width: 342, height: 45))
        loginBtn.layer.cornerRadius = 5 //버튼 모서리 둥글게
        loginBtn.backgroundColor = .systemGray6
        loginBtn.setTitle("카카오계정 로그인", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)  //버튼 타이틀 크기 조절
        loginBtn.addTarget(self, action: #selector(touchupLogin), for: .touchUpInside)
        return loginBtn
    }()
    
     let makeAccountBtn : UIButton = {
        let makeAccountBtn = UIButton(frame: CGRect(x: 25, y: 465, width: 342, height: 45))
        makeAccountBtn.layer.cornerRadius = 5
        makeAccountBtn.backgroundColor = .systemGray6
        makeAccountBtn.setTitle("새로운 카카오계정 만들기", for: .normal)
        makeAccountBtn.setTitleColor(.black, for: .normal)
        makeAccountBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
         makeAccountBtn.addTarget(self, action: #selector(touchupMakeAccount), for: .touchUpInside)
        return makeAccountBtn
    }()
    
    private let findLabel : UILabel = {
       let findLabel = UILabel(frame: CGRect(x: 74, y: 523, width: 250, height: 20))
        findLabel.text = "카카오계정 또는 비밀번호 찾기"
        findLabel.font = .systemFont(ofSize: 12)
        findLabel.textAlignment = .center
        return findLabel
    }()
    
    private func assignPushToSecondVC () {
        let secondVC = AssignSecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    private func assignPresentToThirdVC() {
        let thirdVC = AssignThirdViewController()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let components : [Any] = [kakaoTitle, subTitle, account, underLineView, passWd, underLineView2, loginBtn, makeAccountBtn, findLabel]
        components.forEach{
            view.addSubview($0 as! UIView)

        }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
