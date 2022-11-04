//
//  GridCollectionViewCell.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/11/04.
//

import UIKit
import SnapKit
import Then

//MARK: -GridCollectionViewCell
class GridCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    static let identifier = "GridCollectionViewCell"
    
    //MARK: - UI Components
    private let gridImageContainerView = UIView()
    private let gridImageView = UIImageView()
    
    //MARk: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Extensions

extension GridCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(gridImageContainerView)
        gridImageContainerView.addSubview(gridImageView)
        
        gridImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        gridImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    //MARK: - General Helpers
    
    func dataBind(model: GridPhotoModel) {
        gridImageView.image = UIImage(named: model.photoImage)
    }
}
