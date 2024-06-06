//
//  LotteryViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit
import SnapKit

class LotteryViewController: UIViewController {
    let numberPickerView = UIPickerView()
    lazy var pickerTextField : UITextField = {
        let tf = UITextField()
        tf.configureBorderLineTextField(placeholder: "회차를 선택해주세요")
        tf.inputView = numberPickerView
        tf.textAlignment = .center
        return tf
    }()
    
    var lottoValue : Lotto?
    let episodeNumberList = Array(900...986).sorted(by: >)
    lazy var selectedEpisode = episodeNumberList.first {
        didSet{
            guard let selectedEpisode else {return }
            getLottoInfo(episode: selectedEpisode)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
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
        view.addSubview(pickerTextField)
    }
    
    private func configureLayout() {
        pickerTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
            
        }
    }
    
    // MARK: - APIFetch
    private func getLottoInfo(episode : Int) {
        APIFetcher().getLottoInfo(episode : episode){ [weak self] value in
            guard let self else{return }
            self.lottoValue = value
        }
    }

}
