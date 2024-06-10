//
//  TrendTableViewCell.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import UIKit
import Kingfisher

class TrendTableViewCell: UITableViewCell {
    // MARK: - UI
    let dateLabel : UILabel = {
        let label = UILabel()
        label.configureSubLabel()
        label.text = "00/00/0000"
        return label
    }()
    
    let genreLabel : UILabel = {
        let label = UILabel()
        label.configureTitleLabel()
        label.text = "#Mystery"
        return label
    }()
    
    let cardContentView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        
        return view
    }()
    
    let mainImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .gray
        iv.clipsToBounds = true //why??
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let bottomLabelGroupView : UIView = {
       let view = UIView()
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.configureTitleLabel()
        label.text = "영화제목"
        return label
    }()
    
    let overViewLabel : UILabel = {
        let label = UILabel()
        label.configureSubLabel()
        label.text = "A mild-mannered professor moonlighting as a fake hit man in police stings ignites a chain reaction of trouble when he falls for a potential client."
        return label
    }()
    
    let separator = Separator(color: .gray)
    
    let showDetailLabel : UILabel = {
        let label = UILabel()
        label.text = "자세히 보기"
        label.configureSubLabel()
        return label
    }()
    
    let arrowImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = .lightGray
        return iv
    }()
    
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ConfigureData
    func configureData(data : MovieTrendResult) {
        dateLabel.text = data.releaseDate
//        genreLabel.text = ""
        let imageURL = URL(string: "\(APIURL.tmdbImagePrefixURL)\(data.posterPath)")
        mainImageView.kf.setImage(with: imageURL)
        titleLabel.text = data.originalTitle
        overViewLabel.text = data.overview
        
    }
    
    // MARK: - ConfigureUI
    
    func configureSubView() {
        [dateLabel, genreLabel,cardContentView]
            .forEach{
                contentView.addSubview($0)
            }
        
        [mainImageView,bottomLabelGroupView]
            .forEach {
                cardContentView.addSubview($0)
            }
        
        [titleLabel, overViewLabel, separator, showDetailLabel, arrowImageView]
            .forEach {
                bottomLabelGroupView.addSubview($0)
            }
    }
    
    func configureLayout() {
        dateLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView)
            
        }
        
        
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView)
        }
        
        //cardContentView
        cardContentView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.top.equalTo(genreLabel.snp.bottom).offset(10)

            make.bottom.equalTo(bottomLabelGroupView.snp.bottom)
            make.bottom.equalTo(contentView.snp.bottom).inset(50)

        }
        
        mainImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.height.equalTo(250)
        }
        
        
        bottomLabelGroupView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(mainImageView.snp.bottom).offset(20)
            make.bottom.equalTo(arrowImageView.snp.bottom).offset(10)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
        }
        
        overViewLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        separator.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(overViewLabel.snp.bottom).offset(20)
        }
        
        showDetailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(separator.snp.bottom).offset(20)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(showDetailLabel.snp.centerY)
        }
        
        
    }
    
    
}
