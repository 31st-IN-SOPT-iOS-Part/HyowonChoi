//
//  PhotoGridVeiwController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/11/01.
//

import UIKit
import SnapKit
import Then

final class ChatCollectionViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let chatHeadView = UIView()
    
    private let friendLabel : UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    private let openChatLabel : UILabel = {
        let label = UILabel()
        label.text = "오픈채팅"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    private let settingBtn : UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let photoAddBtn : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupAddPhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var chatCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: - Variables
    
    var chatList: [ChatCollectionModel] = [
        ChatCollectionModel(chatImage: "profileImage1", chatName: "안솝트", chatMsg: "언제 볼건데??", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage2", chatName: "최솝트", chatMsg: "피곤해요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage3", chatName: "정솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage4", chatName: "강솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage5", chatName: "오솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage6", chatName: "황솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage7", chatName: "고솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage8", chatName: "하솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage9", chatName: "황솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage3", chatName: "정솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage4", chatName: "강솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage5", chatName: "오솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage6", chatName: "황솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage7", chatName: "고솝트", chatMsg: "살려줘요", chatTime: "오후 9:41"),
        ChatCollectionModel(chatImage: "profileImage8", chatName: "하솝트", chatMsg: "살려줘요", chatTime: "오후 9:41")
    ]

    
    //MARK: - Screen Change
    private func addBtnPresentToGridVC() {
        let gridVC = GridPhotoViewController()
        gridVC.modalPresentationStyle = .fullScreen
        self.present(gridVC, animated: true, completion: nil)
    }
    
    @objc
    private func touchupAddPhoto() {
        addBtnPresentToGridVC()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        configButton()
        layout()
    }

}

//MARK: - Extensions

extension ChatCollectionViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        
        [friendLabel, openChatLabel, photoAddBtn, settingBtn].forEach {
            chatHeadView.addSubview($0)
        }
        
        [ chatHeadView, chatCollectionView].forEach {
            view.addSubview($0)
        }
        
        chatHeadView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
        }
        
        openChatLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(friendLabel.snp.trailing).offset(7)
        }
        
        photoAddBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(settingBtn.snp.leading).offset(-12)
            $0.width.equalTo(19)
            $0.height.equalTo(19)
        }
        
        settingBtn.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            $0.width.equalTo(19)
            $0.height.equalTo(19)
            
        }
        
        
        chatCollectionView.snp.makeConstraints {
            $0.top.equalTo(chatHeadView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50 * chatList.count)
        }
    }
    
    private func configButton() {
        settingBtn.setBackgroundImage(UIImage(named:"settings"), for: .normal)
        photoAddBtn.setBackgroundImage(UIImage(named: "iconPlus"), for: .normal)
    }
    
    //MARK: - General Helpers
    private func register() {
        chatCollectionView.register(ChatCollectionViewCell.self, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
        chatCollectionView.register(ChatCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatCollectionReusableView.identifier)
    }
}

//MARK: - UICollectionView DelegateFlowLayout
extension ChatCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           
           //ofKind에 UICollectionView.elementKindSectionHeader로 헤더를 설정해주고
           //withReuseIdentifier에 헤더뷰 identifier를 넣어주고
           //생성한 헤더뷰로 캐스팅해준다.
        let headerview = chatCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatCollectionReusableView.identifier, for: indexPath) as! ChatCollectionReusableView
        headerview.layer.cornerRadius = 5
        
           return headerview
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 75)
    }
}

//MARK: - UICollectionView DataSource

extension ChatCollectionViewController: UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath)
                as? ChatCollectionViewCell else {return UICollectionViewCell() }
        chatCell.dataBind(model: chatList[indexPath.item])
        return chatCell
    }
}
