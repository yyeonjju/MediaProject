//
//  CastTableViewCell.swift
//  MediaProject
//
//  Created by 하연주 on 6/11/24.
//

import UIKit
import SnapKit
import Kingfisher

class CastTableViewCell: UITableViewCell {
    
    // MARK: - UI
    private let profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
        iv.clipsToBounds = true
        return iv
    }()
    
    private let labelsGroupView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.configureTitleLabel()
        label.text = "nameLabel"
        return label
    }()
    
    private let characterName : UILabel = {
        let label = UILabel()
        label.configureSubLabel()
        label.text = "characterName"
        return label
    }()
    
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configureData
    func configureData(data : Cast) {
        nameLabel.text = data.originalName
        characterName.text = data.character
        let imageURL = URL(string: "\(APIURL.tmdbImagePrefixURL)\(data.profilePath ?? "")")
        profileImageView.kf.setImage(with: imageURL)
        
    }

    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [profileImageView, labelsGroupView]
            .forEach{
                addSubview($0)
            }
        [nameLabel, characterName]
            .forEach{
                labelsGroupView.addSubview($0)
            }
    }
    
    
    
    func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(10)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.width.equalTo(70)
            
        }
        
        labelsGroupView.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).inset(10)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(labelsGroupView.snp.leading).offset(10)
            
        }
        characterName.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.equalTo(labelsGroupView.snp.leading).offset(10)
            
        }
        
        
        
    }


}
