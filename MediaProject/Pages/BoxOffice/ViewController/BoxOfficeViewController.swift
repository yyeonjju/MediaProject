//
//  BoxOfficeViewController.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit
import SnapKit

class BoxOfficeViewController: UIViewController {
    // MARK: - UI
    private let searchTextField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.tintColor = .white
        tf.textColor = .white
        tf.configurePlaceholderColor("20240606 날짜 형태로 입력해주세요", .white)
        return tf
    }()
    
    private let searchButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    private let separator = Separator(color: .white)
    
    private let movieTableView : UITableView = {
        let tv = UITableView()
        tv.rowHeight = 50
        tv.backgroundColor = .clear
        return tv
    }()
    
    private let emptyView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.opacity = 0.7
        let label = UILabel()
        label.text = "검색어를 다시 확인해주세요"
        label.textColor = .black
        label.configureMainBigLabel()
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        view.isHidden = true
        return view
    }()
    
    
    // MARK: - Properties
    var boxOfficeData : BoxOffice? {
        didSet{
            movieTableView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupBackgroundColor()
        hideKeyboardWhenTappedAround()
        
        setupDelegate()
        configureSubview()
        configureLayout()
        setupAddTarget()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate(){
        searchTextField.delegate = self
        
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        movieTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: BoxOfficeTableViewCell.identifier)
    }
    
    // MARK: - SetupAddTarget
    private func setupAddTarget() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - SetupTargetAction
    @objc private func searchButtonTapped() {
        getBoxOfficeData()
        view.endEditing(true)
    }

    // MARK: - SetupUI
    
    private func configureSubview() {
        [searchTextField, searchButton, separator, movieTableView, emptyView]
            .forEach{
                view.addSubview($0)
            }
    }
    
    private func configureLayout(){
        searchTextField.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(searchButton.snp.leading).offset(-10)
            make.height.equalTo(50)
        }
        separator.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom)
            make.horizontalEdges.equalTo(searchTextField.snp.horizontalEdges)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
            make.width.equalTo(70)
        }
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalToSuperview()
        }
        
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(200)
        }
        
        
    }
    
    // MARK: - APIFetch
    private func getBoxOfficeData() {

        guard let searchText = searchTextField.text else {return }
        APIFetcher.shared.getBoxOfficeData(targetDate: searchText) { [weak self] value in
            guard let self else{return }
            self.emptyView.isHidden = true
            self.movieTableView.isHidden = false
            self.boxOfficeData = value
        } errorHandler: { [weak self] in
            guard let self else{return }
            self.emptyView.isHidden = false
            self.movieTableView.isHidden = true
        }
    }
    
    
}

extension BoxOfficeViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        searchButtonTapped()
        return true
    }
}
