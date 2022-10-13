//
//  KakaoFriendListViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/10.
//

import UIKit
import SnapKit

class KakaoFriendListViewController: UIViewController {
    
    private let friendLabel : UILabel = {
       let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let settingBtn : UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let profileBtn : UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(touchupProfileBtn), for: .touchUpInside)
        return button
    }()
    
    private func backgroundColor() {
        view.backgroundColor = .white
    }
    
    
    private func presentToProfileVC() {
        let profileVC = KakaoProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
  
    @objc
    private func touchupProfileBtn() {
        presentToProfileVC()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor()
        layout()
        configButton()
    }
}

extension KakaoFriendListViewController {
    
    private func layout() {
        [friendLabel, settingBtn, profileBtn].forEach{
            view.addSubview($0)
        }
        
        friendLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(12)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            
        }
        
        settingBtn.snp.makeConstraints{ make in
            make.top.equalTo(self.friendLabel)
            make.leading.equalTo(self.friendLabel.snp.trailing).offset(5)
            make.width.equalTo(25)
            make.height.equalTo(25)
            
        }
        
        profileBtn.snp.makeConstraints{ make in
            make.top.equalTo(self.friendLabel.snp.bottom).offset(25)
            make.leading.equalTo(self.friendLabel)
            make.width.equalTo(59)
            make.height.equalTo(58)
        }
        
    }
    
    private func configButton() {
        settingBtn.setBackgroundImage(UIImage(named:"settings"), for: .normal)
        profileBtn.setBackgroundImage(UIImage(named: "profile_userImg"), for: .normal)
    }
}
