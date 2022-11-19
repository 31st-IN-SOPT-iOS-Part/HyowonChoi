//
//  KakaoFriendListViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/10.
//

import UIKit
import SnapKit
import Then

final class FriendListViewController: UIViewController {
    
    // MARK: - UI Components
    
    
    private let friendLabel : UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    private let settingBtn : UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    private lazy var friendTableView: UITableView = {
        //헤더 고정 해제
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black.withAlphaComponent(0.1)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Variables
    var friendList: [FriendListModel] = [
        FriendListModel(profileImage: "profileImage1", profileName: "안솝트", profileMsg: "언제 볼건데??"),
        FriendListModel(profileImage: "profileImage2", profileName: "최솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage3", profileName: "정솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage4", profileName: "강솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage5", profileName: "오솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage6", profileName: "황솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage7", profileName: "최솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage8", profileName: "고솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage9", profileName: "하솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage6", profileName: "황솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage7", profileName: "최솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage8", profileName: "고솝트", profileMsg: "살려줘요"),
        FriendListModel(profileImage: "profileImage9", profileName: "하솝트", profileMsg: "살려줘요")
    ]
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configButton()
        register()
    }
    
}

// MARK: - Extensions

extension FriendListViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        
        [friendLabel, settingBtn, friendTableView].forEach{
            view.addSubview($0)
        }
        
        
        friendLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(12)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.width.equalTo(41)
            make.height.equalTo(21)
            
        }
        
        settingBtn.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(12)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.width.equalTo(19)
            make.height.equalTo(19)
            
        }
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(friendLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50 * friendList.count)
        }
    }
    
    private func configButton() {
        settingBtn.setBackgroundImage(UIImage(named:"settings"), for: .normal)
    }
    
    //MARK: - General Helpers
    private func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
        friendTableView.register(MyProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: MyProfileHeaderView.identifier)
    }
}

//MARK: - UITableViewDelegate

extension FriendListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyProfileHeaderView.identifier) as? MyProfileHeaderView else {
            return UIView()
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
   
}

//MARK: - UITableViewDataSource

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath)
                as? FriendTableViewCell else { return UITableViewCell() }
        friendCell.dataBind(model: friendList[indexPath.row])
        return friendCell
    }
}




