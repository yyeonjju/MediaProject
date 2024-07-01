//
//  NasaImageCollectionView.swift
//  MediaProject
//
//  Created by 하연주 on 7/1/24.
//

import UIKit
import SnapKit


final class NasaImageCollectionViewCell : UICollectionViewCell {
    lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    
    var loadingBuffer : Data = Data() {
        didSet{
            let progressLabelText = Double(loadingBuffer.count) / total
            progressLabel.text = "\(progressLabelText * 100) \n / 100 "
        }
    }
    var total : Double = 0
    var row : Int?
    
    // MARK: - UI
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.configureDefaultImageView()
        return iv
    }()
    
    let progressLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "0 \n /100"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        configureSubView()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ConfigureData()
    func configureData(data : NasaData, row : Int){
        loadImage(url: data.imageURL)
        
        self.row = row
    }
    
    func loadImage(url : URL) {
        let request = URLRequest(url: url)
        session.dataTask(with: request).resume()
    }
    

    
    // MARK: - ConfigureUI
    
    private func configureSubView() {
        [imageView, progressLabel]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    private func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.centerY.horizontalEdges.equalTo(contentView)
        }
    }

}


extension NasaImageCollectionViewCell : URLSessionDataDelegate {
    
    //최초로 응답받았을 때
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode){
            //총 데이터 가져와야함-> 헤더의 content length
            let contentLength = response.value(forHTTPHeaderField: "Content-Length")!
            total = Double(contentLength)!
            
            return .allow
        } else {
            return .cancel
        }

    }
    
    
    //데이터 받아올때마다 반복적 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        loadingBuffer.append(data)
    }
    
    //데이터 다 받아 왔을 때!
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        
        if error != nil {
            progressLabel.text = "완료하지 못했습니다."
        }else {
            imageView.image = UIImage(data: loadingBuffer)
        }
    }
    
    
}
