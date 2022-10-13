//
//  FirstViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by 최효원 on 2022/10/01.
//

import UIKit

class FirstViewController: UIViewController {

    private let questionLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 250, height: 30))
        label.text = "민초 vs 반민초 당신의 선택은?"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let answerTextField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 80, y: 280, width: 250, height: 40))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.font = .systemFont(ofSize: 18, weight: .medium)
        return textField
        
    }()
    
    private let nextButton : UIButton = {
       let button = UIButton(frame: CGRect(x: 80, y: 350, width: 250, height: 42))
        button.setTitle("다음으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        //touchUpInside => 터치 했을때 넘어감
        button.addTarget(self, action: #selector(touchupNextButton), for:.touchUpInside)
    
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //addSubView 세개 하기 어려우니까 배열을 하나 만들어서 세개 다 넣어줌
        let components: [Any] = [questionLabel, answerTextField, nextButton]
        components.forEach{
            //ViewController가 View안에 들어갈 수 없으므로, UIView 형태로 추가해줌
            // ! => 강제 언래핑 , UIViewController가 추가되면 앱 죽음
            // $0 => 언소 하나하나를 의미 (달러사인제로)
            view.addSubview($0 as! UIView)
        }
        
    }
    
    private func presentToSecondVC() {
        let secondVC = SecondViewController()
        //.formsheet => 뒤에 끝까지 올라가지 않고 여러 창 형태로 보임
        secondVC.modalPresentationStyle = .formSheet
//        secondVC.result = answerTextField.text
        if let answer = answerTextField.text{
        secondVC.dataBind(result: answer)
        }
        //present => 화면 넘어가는 함수 (어떤거?, 애니메이션 할거?,  )
        self.present(secondVC, animated: true, completion: nil)
    }
    
    
    private func pushToSecondVC() {
        let secondVC = SecondViewController()
//        secondVC.result = answerTextField.text
        guard let answer = answerTextField.text else { return }
        secondVC.dataBind(result: answer)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func touchupNextButton() {
        presentToSecondVC()
        //pushToSecondVC()
    }

}
