//
//  ChatCollectionViewCell.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/11/04.
//

import UIKit
import SnapKit
import Then

//MARK: - ChatCollectionViewCell

class ChatCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    static let identifier = "ChatCollectionViewCell"
    
    //MARK: - UI Components
    
    private let chatImageContainerView = UIView()
    private let chatImageView = UIImageView()
    private let chatNameLabel = UILabel().then() {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let chatMsgLabel = UILabel().then() {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 11, weight: .light)
        
    }
    
    private let chatTimeLabel = UILabel().then() {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 8, weight: .light)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - Extension

extension ChatCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [chatImageContainerView, chatNameLabel, chatMsgLabel, chatTimeLabel].forEach {
            contentView.addSubview($0)
        }
        
        chatImageContainerView.addSubview(chatImageView)
        
        chatImageContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(44)
            $0.height.equalTo(41)
        }
        chatImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        chatNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(chatImageContainerView.snp.trailing).offset(11)
        }
        chatMsgLabel.snp.makeConstraints{
            $0.top.equalTo(chatNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(chatNameLabel)
        }
        
        chatTimeLabel.snp.makeConstraints {
            $0.top.equalTo(chatNameLabel.snp.top)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    //MARK: - General Helpers
    
    func dataBind(model: ChatCollectionModel) {
        chatImageView.image = UIImage(named: model.chatImage)
        chatNameLabel.text = model.chatName
        chatMsgLabel.text = model.chatMsg
        chatTimeLabel.text = model.chatTime
    }
}
