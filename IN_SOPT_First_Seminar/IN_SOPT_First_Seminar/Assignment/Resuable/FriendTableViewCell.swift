//
//  FriendTableViewCell.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/11/03.
//

import UIKit
import SnapKit
import Then

//MARK: - FriendTableViewCell

class FriendTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "FriendTableViewCell"
    
    //MARK: - UI Components
    
    private let friendListContainerView = UIView()
    private let profileImageView = UIImageView()
    private let profileNameLabel = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let profileMsgLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 11, weight: .light)
    }
    
    //MARK: - LifeCycles
    
    //코드로 작성할 때 frame을 호출해서 초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    //스토리보드에서 UI 초기화 시킬 때 사용
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension FriendTableViewCell {
    
    // MARK: - Layout Helpers

    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [friendListContainerView, profileImageView, profileNameLabel, profileMsgLabel].forEach {
            contentView.addSubview($0)
        }
        
        friendListContainerView.addSubview(profileImageView)
        friendListContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(44)
            $0.height.equalTo(41)
        }
        profileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        profileNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(friendListContainerView.snp.trailing).offset(11)
        }
        profileMsgLabel.snp.makeConstraints{
            $0.top.equalTo(profileNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(profileNameLabel)
        }
    }
    
    //MARK: - General Helpers
    func dataBind(model: FriendListModel) {
        profileImageView.image = UIImage(named: model.profileImage)
        profileNameLabel.text = model.profileName
        profileMsgLabel.text = model.profileMsg
    }
}
