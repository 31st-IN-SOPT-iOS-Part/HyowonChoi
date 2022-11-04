//
//  ChatCollectionReusableView.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/11/04.
//

import UIKit

//MARK: -ChatCollectionReusableView
class ChatCollectionReusableView: UICollectionReusableView {
    
    //MARK: - Identifier
    static let identifier = "ChatCollectionReusableView"
    
    //MARK: - UI Components
    private let collectionBanner = UIImageView().then {
        $0.image = UIImage(named: "hyowonChoi")
        $0.contentMode = .scaleAspectFit
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChatCollectionReusableView {
    private func layout() {
        collectionBanner.layer.cornerRadius = 30
        collectionBanner.clipsToBounds = true
        self.addSubview(collectionBanner)
        collectionBanner.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
