//
//  SignupViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/4/24.
//

import UIKit
import SnapKit

class SignupViewController: UIViewController {
    private let logoLabel : UILabel = {
        let label = UILabel()
        label.text = "YEONFLIX"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .red
        return label
    }()
    
    private let idTextField = SignupTextField(placeholder: "이메일 주소 또는 전화번호")
    private let pwTextField = SignupTextField(placeholder: "비밀번호")
    private let nicknameTextField = SignupTextField(placeholder: "닉네임")
    private let locationTextField = SignupTextField(placeholder: "위치")
    private let codeTextField = SignupTextField(placeholder: "추천 코드 입력")
    
    private let signupButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        
        return btn
    }()
    
    
    private lazy var textFieldStackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [idTextField, pwTextField, nicknameTextField, locationTextField, codeTextField, signupButton])
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 15
        sv.alignment = .center
        
        return sv
    }()
    
    private let additionalInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.textColor = .white
        return label
    }()
    
    lazy var controlSwitch: UISwitch = {
        let swicth = UISwitch()
        swicth.subviews.first?.subviews.first?.backgroundColor = .lightGray // 스위치가 off 상태일 때 배경색
        swicth.onTintColor = .red
        swicth.isOn = true
        
        swicth.addTarget(self, action: #selector(switchTapped), for: .valueChanged)
        return swicth
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundColor()
        
        setupAddSubView()
        setupLayout()
    }
    
    // MARK: - Layout
    private func setupAddSubView() {
        view.addSubview(logoLabel)
        view.addSubview(textFieldStackView)
        view.addSubview(additionalInfoLabel)
        view.addSubview(controlSwitch)
    }
    
    private func setupLayout() {
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalTo(view)
        }
        
        idTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        
        codeTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        
        signupButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
//            make.top.equalTo(textFieldStackView.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(logoLabel.snp.bottom).offset(100)
        }
        
        additionalInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(textFieldStackView.snp.bottom).offset(20)
            make.leading.equalTo(textFieldStackView.snp.leading)
        }
        
        controlSwitch.snp.makeConstraints { make in
            make.top.equalTo(textFieldStackView.snp.bottom).offset(20)
            make.trailing.equalTo(textFieldStackView.snp.trailing)
        }

        
    }
    
    // MARK: - Event
    
    @objc private func switchTapped() {
        
    }

    
    
    
    
    

    
    
    


}
