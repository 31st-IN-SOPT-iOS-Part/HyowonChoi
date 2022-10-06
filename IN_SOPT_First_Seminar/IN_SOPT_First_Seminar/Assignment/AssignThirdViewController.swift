//
//  AssignThirdViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/06.
//

import UIKit

class AssignThirdViewController: UIViewController {
    
    var userAccount:String?
    
    private let welcomeLabel : UILabel = {
        let welcomeLabel = UILabel(frame: CGRect(x: 55, y: 250, width: 280, height: 100))
        welcomeLabel.text = "000 님 \n \n 환영합니다"
        welcomeLabel.textAlignment = .center    //가운데 정렬
        //줄바꿈
        welcomeLabel.numberOfLines = 0
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.font = .systemFont(ofSize: 20, weight: .medium)
        return welcomeLabel
    }()
    
    private let thirdCheckBtn : UIButton = {
       let thirdCheckBtn = UIButton(frame: CGRect(x: 25, y: 465, width: 342, height: 45))
        thirdCheckBtn.layer.cornerRadius = 5
        thirdCheckBtn.backgroundColor = UIColor(red: 0.976, green: 0.878, blue: 0, alpha: 100)  //카카오 색 적용
        thirdCheckBtn.setTitle("확인", for: .normal)
        thirdCheckBtn.setTitleColor(.black, for: .normal)
        thirdCheckBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        thirdCheckBtn.addTarget(self, action: #selector(returnFirstVC), for: .touchUpInside)
       return thirdCheckBtn
   }()
    
    @objc
    private func returnFirstVC() {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        self.dismiss(animated: false) {
            presentingVC.popToRootViewController(animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(thirdCheckBtn)
        // Do any additional setup after loading the view.
    }
    
    func dataBind(result:String) {
        welcomeLabel.text = "\(result) 님 \n \n 환영합니다"
    }
}
