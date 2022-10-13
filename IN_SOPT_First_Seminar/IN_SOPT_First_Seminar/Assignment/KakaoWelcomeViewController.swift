//
//  AssignThirdViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/06.
//

import UIKit
import SnapKit

class KakaoWelcomeViewController: UIViewController {
    
    var userAccount:String?
    
    private let welcomeLabel : UILabel = {
//        let welcomeLabel = UILabel(frame: CGRect(x: 55, y: 250, width: 280, height: 100))
        let welcomeLabel = UILabel()
        welcomeLabel.text = "000님 \n 환영합니다"
        welcomeLabel.textAlignment = .center    //가운데 정렬
        //줄바꿈
        welcomeLabel.numberOfLines = 0
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.font = .systemFont(ofSize: 20, weight: .medium)
        return welcomeLabel
    }()
    
    private let thirdCheckBtn : UIButton = {
//       let thirdCheckBtn = UIButton(frame: CGRect(x: 25, y: 465, width: 342, height: 45))
        let thirdCheckBtn = UIButton()
        thirdCheckBtn.layer.cornerRadius = 5
        thirdCheckBtn.backgroundColor = UIColor(red: 0.976, green: 0.878, blue: 0, alpha: 100)  //카카오 색 적용
        thirdCheckBtn.setTitle("확인", for: .normal)
        thirdCheckBtn.setTitleColor(.black, for: .normal)
        thirdCheckBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        thirdCheckBtn.addTarget(self, action: #selector(returnLoginVC), for: .touchUpInside)
       return thirdCheckBtn
   }()
    
    @objc
    private func returnLoginVC() {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        self.dismiss(animated: false) {
            presentingVC.popViewController(animated: false)
        }
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        layout()
    }
    
    func dataBind(result:String) {
        welcomeLabel.text = "\(result) 님 \n \n 환영합니다"
    }
}

extension KakaoWelcomeViewController {
    private func layout() {
        [welcomeLabel, thirdCheckBtn].forEach{
            view.addSubview($0)
        }
        
        welcomeLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(170)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(280)
            make.height.equalTo(100)
        }
        
        thirdCheckBtn.snp.makeConstraints{ make in
            make.top.equalTo(self.welcomeLabel.snp.bottom).offset(117)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(333)
            make.height.equalTo(44)
        }
    }
}
