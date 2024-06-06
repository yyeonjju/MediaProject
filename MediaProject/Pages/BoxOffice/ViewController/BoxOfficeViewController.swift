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
        tf.configurePlaceholderColor("날짜를입력해주세요", .white)
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
    
    
    // MARK: - Properties
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundColor()
        
        setupDelegate()
        configureSubview()
        configureLayout()
    }
    
    // MARK: - SetupDelegate
    private func setupDelegate(){
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        movieTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: BoxOfficeTableViewCell.identifier)
    }
    
    
    // MARK: - SetupUI
    
    private func configureSubview() {
        [searchTextField, searchButton, separator, movieTableView]
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
        
        
    }
    
    // MARK: - APIFetch

    
    
}
