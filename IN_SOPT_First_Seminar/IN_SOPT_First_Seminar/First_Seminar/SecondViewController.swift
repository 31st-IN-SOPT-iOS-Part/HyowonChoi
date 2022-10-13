//
//  SecondViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/01.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let resultLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 300, height: 30))
        label.text = "당신의 선택은 이거였군요!"
        label.font = .systemFont(ofSize: 24, weight:.bold)
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 260, width: 80, height: 30))
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button
    }()
    
    //옵셔널(?) : 값이 있을수도, 없을수도 있다.
    var result:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(resultLabel)
        view.addSubview(backButton)
//        dataBind()
        // Do any additional setup after loading the view.
    }
    
    private func dataBind() {
        if let newResult = self.result {
        resultLabel.text = "당신의 선택은 \(newResult)였군요!"
        }
    }
    
     func dataBind(result:String){
        resultLabel.text = "당신의 선택은 \(result)였군요!"
    }
    
    //뒤로가기 버튼
    @objc
    private func touchupBackButton() {
        //없을때는 present로 왔다고 간주하고 (stack 없음, 안쌓임) dismiss로 뒤로가기
        if self.navigationController == nil {
            self.dismiss(animated: true)
        }
        //없을때는 push로 왔다고 간주하고 pop으로 뒤로가기
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
