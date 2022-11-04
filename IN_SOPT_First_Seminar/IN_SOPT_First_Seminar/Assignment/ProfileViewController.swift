//
//  KakaoProfileViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/10.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let returnBtn : UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let profileImgBtn : UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let profileNameLabel : UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let underLineView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(red: 0.925, green: 0.929, blue: 0.933, alpha: 0.5)
        return view
    }()
    
    //나와의 채팅
    private let chatImgBtn : UIButton = {
       let button = UIButton()
        return button
    }()
  
    private let chatLabel : UILabel = {
       let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let chatStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.isUserInteractionEnabled = true  //stack 영역에 tap gesture 허용
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    
    //프로필 편집
    private let editProfileBtn : UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let editProfileLabel : UILabel = {
       let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let editProfileStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.isUserInteractionEnabled = true  //stack 영역에 tap gesture 허용
        stack.spacing = 10
        return stack
    }()

    
    //카카오스토리
    private let kakaoStoryBtn : UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let kakaoStoryLabel : UILabel = {
       let label = UILabel()
        label.text = "카카오스토리"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let kakaoStoryStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.isUserInteractionEnabled = true  //stack 영역에 tap gesture 허용
        return stack
    }()
    

    private let allStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
       return stack
    }()
    
    private func backgroundColor() {
        view.backgroundColor = UIColor(red: 0.53, green: 0.57, blue: 0.6, alpha: 1.0)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor()
        configButton()
        layout()

    }
}

extension ProfileViewController {
    private func layout() {
        [returnBtn, profileImgBtn, profileNameLabel, underLineView, allStackView].forEach {
            view.addSubview($0)
        }
        
        [chatImgBtn, chatLabel].forEach {
            chatStackView.addArrangedSubview($0)
        }
        [editProfileBtn, editProfileLabel].forEach {
            editProfileStackView.addArrangedSubview($0)
        }
        [kakaoStoryBtn, kakaoStoryLabel].forEach {
            kakaoStoryStackView.addArrangedSubview($0)
        }
        
        [chatStackView, editProfileStackView, kakaoStoryStackView].forEach {
            allStackView.addArrangedSubview($0)
        }
        
        returnBtn.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
        
        profileImgBtn.snp.makeConstraints{ make in
            make.top.equalTo(self.returnBtn.snp.bottom).offset(442)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(97)
            make.height.equalTo(96)
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.profileImgBtn.snp.bottom).offset(8)
            make.centerX.equalTo(self.profileImgBtn)
        }
        
        underLineView.snp.makeConstraints{ make in
            make.top.equalTo(self.profileNameLabel).offset(42)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(0.5)

        }

        allStackView.snp.makeConstraints { make in
            make.top.equalTo(self.underLineView).offset(20)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(30)
        }
    }
    
    private func configButton() {
        returnBtn.setBackgroundImage(UIImage(named: "profile_closeBtn"), for: .normal)
        profileImgBtn.setBackgroundImage(UIImage(named: "profile_userImg"), for: .normal)
        chatImgBtn.setBackgroundImage(UIImage(named: "profileTalkImg"), for: .normal)
        editProfileBtn.setBackgroundImage(UIImage(named: "profile_editImg"), for: .normal)
        kakaoStoryBtn.setBackgroundImage(UIImage(named: "profileStoryImg"), for: .normal)

    }
    
}
