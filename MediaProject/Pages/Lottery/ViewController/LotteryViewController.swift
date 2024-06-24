//
//  LotteryViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit
import SnapKit

class LotteryViewController: UIViewController {
    
    // MARK: - UI
    let numberPickerView = UIPickerView()
    lazy var pickerTextField : UITextField = {
        let tf = UITextField()
        tf.configureBorderLineTextField(placeholder: "회차를 선택해주세요")
        tf.inputView = numberPickerView
        tf.textAlignment = .center
        return tf
    }()
    let infoLabel : UILabel = {
        let label = UILabel()
        label.text = "당첨번호 안내"
        return label
    }()
    let dateLabel : UILabel = {
        let label = UILabel()
        label.text = "0000-00-00 추첨"
        label.configureSubLabel()
        return label
    }()
    
    let resultLabel : UILabel = {
        let label = UILabel()
        label.text = "-회 당첨결과"
        label.configureMainBigLabel()
        return label
    }()
    

    
    let number1Label = NumberBallLabel(text:"00",color: .orange)
    let number2Label = NumberBallLabel(text:"00",color: .cyan)
    let number3Label = NumberBallLabel(text:"00",color: .cyan)
    let number4Label = NumberBallLabel(text:"00",color: .systemPink)
    let number5Label = NumberBallLabel(text:"00",color: .systemPink)
    let number6Label = NumberBallLabel(text:"00",color: .lightGray)
    let plusLabel : UILabel = {
        let label = UILabel()
        label.text = "+"
        label.configureTitleLabel()
        label.textAlignment = .center
        return label
    }()
    let bodusNumberLabel = NumberBallLabel(text:"00",color: .lightGray)
    
    lazy var numbersLabelList = [number1Label, number2Label, number3Label, number4Label, number5Label, number6Label, plusLabel,bodusNumberLabel]
    lazy var numbersStackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: numbersLabelList)

        sv.axis = .horizontal
        sv.spacing = 10
        sv.distribution = .equalSpacing
        sv.alignment = .center
        return sv
    }()
    
    // MARK: - Properties
    var lottoValue : Lotto? {
        didSet{
            setupData()
        }
    }
    let episodeNumberList = Array(900...986).sorted(by: >)
    lazy var selectedEpisode = episodeNumberList.first {
        didSet{
            guard let selectedEpisode else {return }
            getLottoInfo(episode: selectedEpisode)
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        
        setupDelegate()
        configureSubview()
        configureLayout()
    }
    
    // MARK: - SetupDelegate

    private func setupDelegate() {
        numberPickerView.delegate = self
        numberPickerView.dataSource = self
        
    }
    
    // MARK: - SetupUI

    private func configureSubview() {
        [pickerTextField, infoLabel, dateLabel, resultLabel, numbersStackView]
            .forEach{
                view.addSubview($0)
            }

    }
    
    private func configureLayout() {
        pickerTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
            
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(pickerTextField.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(pickerTextField.snp.bottom).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        numbersStackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            
        }
        
        numbersLabelList.forEach{ label in
            label.snp.makeConstraints { make in
                make.size.equalTo(40)
            }
        }
        
        
        
    }
    
    // MARK: - APIFetch
    private func getLottoInfo(episode : Int) {
        APIFetcher.shared.getLottoInfo(episode : episode){ [weak self] value in
            guard let self else{return }
            self.lottoValue = value
        }
    }
    
    // MARK: - SetupData

    private func setupData() {
        guard let lottoValue else{return }
        
        dateLabel.text = lottoValue.dateLabelText
        
        let colorChangeText = lottoValue.resultLabelText.components(separatedBy: " ")[0]
        resultLabel.text = lottoValue.resultLabelText
        resultLabel.changeSpecificTextColor(searchText: colorChangeText, color: .brown)
        
        let numbers = [lottoValue.drwtNo1 , lottoValue.drwtNo2, lottoValue.drwtNo3, lottoValue.drwtNo4, lottoValue.drwtNo5, lottoValue.drwtNo6, nil, lottoValue.bnusNo]
        numbersLabelList.enumerated().forEach{
            $0.element.text = numbers[$0.offset] == nil ? "+" : String(numbers[$0.offset]!)
        }
        
    }

}
