//
//  GridPhotoViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/11/04.
//

import UIKit
import SnapKit
import Then

class GridPhotoViewController: UIViewController {

    //MARK: - UI Components
    
    private let gridHeadView = UIView()
    
    private let recentItemLabel : UILabel = {
        let label = UILabel()
        label.text = "최근항목"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    
    private let exitBtn : UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.addTarget(self, action: #selector(returnChatVC), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func returnChatVC() {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        self.dismiss(animated: false) {
            presentingVC.popViewController(animated: false)
        }
    }
    
    private let sendLabel : UILabel = {
        let label = UILabel()
        label.text = "전송"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var gridCollectionView: UICollectionView = {
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
    
    var gridList: [GridPhotoModel] = [
        GridPhotoModel(photoImage: "Frame 17"),
        GridPhotoModel(photoImage: "galleryImage1"),
        GridPhotoModel(photoImage: "galleryImage2"),
        GridPhotoModel(photoImage: "galleryImage3"),
        GridPhotoModel(photoImage: "galleryImage4"),
        GridPhotoModel(photoImage: "galleryImage5"),
        GridPhotoModel(photoImage: "galleryImage6"),
        GridPhotoModel(photoImage: "galleryImage7"),
        GridPhotoModel(photoImage: "galleryImage8"),
        GridPhotoModel(photoImage: "galleryImage9"),
        GridPhotoModel(photoImage: "galleryImage10"),
        GridPhotoModel(photoImage: "galleryImage11"),
        GridPhotoModel(photoImage: "galleryImage12"),
        GridPhotoModel(photoImage: "galleryImage13"),
        GridPhotoModel(photoImage: "galleryImage14"),
        GridPhotoModel(photoImage: "galleryImage15"),
        GridPhotoModel(photoImage: "galleryImage16"),
        GridPhotoModel(photoImage: "galleryImage17"),
        GridPhotoModel(photoImage: "galleryImage18"),
        GridPhotoModel(photoImage: "galleryImage19"),
        GridPhotoModel(photoImage: "galleryImage20"),
        GridPhotoModel(photoImage: "galleryImage21"),
        GridPhotoModel(photoImage: "galleryImage22"),
        GridPhotoModel(photoImage: "galleryImage23")
    ]

    //MARK: - Constant
    final let gridInset: UIEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    final let gridLineSpacing:CGFloat = 5
    final let gridInterItemSpacing: CGFloat = 3
    final let gridCellHeight :CGFloat = 123
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        configButton()
        layout()
    }

}

//MARK: - Extensions

extension GridPhotoViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        
        [exitBtn, recentItemLabel, sendLabel].forEach {
            gridHeadView.addSubview($0)
        }
        [ gridHeadView, gridCollectionView].forEach {
            view.addSubview($0)
        }
        
        gridHeadView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(30)
        }
        
        exitBtn.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(14)
            $0.height.equalTo(14)
        }
        
        recentItemLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        sendLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            
        }
        
        gridCollectionView.snp.makeConstraints {
            $0.top.equalTo(gridHeadView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
        
        private func calculateCellHeight() -> CGFloat {
            let count = CGFloat(gridList.count)
            let heightCount = count/3 + count.truncatingRemainder(dividingBy: 2)
            return heightCount * gridCellHeight + (heightCount - 1) * gridLineSpacing + gridInset.top
        
    }
    
    private func configButton() {
        exitBtn.setBackgroundImage(UIImage(named:"Vector"), for: .normal)    }
    
    //MARK: - General Helpers
    private func register() {
        gridCollectionView.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: GridCollectionViewCell.identifier)
    
    }
}

//MARK: - UICollectionView DelegateFlowLayout
extension GridPhotoViewController: UICollectionViewDelegateFlowLayout {
    
    //위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return gridLineSpacing
    }
    
    //옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return gridInterItemSpacing
    }
    
    //cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth - gridInterItemSpacing * 2
        return CGSize(width: cellWidth/3, height: gridCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return gridInset
    }
}

//MARK: - UICollectionView DataSource

extension GridPhotoViewController: UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gridList.count
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let gridCell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.identifier, for: indexPath)
                as? GridCollectionViewCell else {return UICollectionViewCell() }
         gridCell.dataBind(model: gridList[indexPath.item])
        return gridCell
    }
}
