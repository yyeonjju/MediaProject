//
//  NasaImageLoadViewController.swift
//  MediaProject
//
//  Created by 하연주 on 7/1/24.
//

import UIKit

struct NasaData {
    let imageURL : URL
    var loadingBuffer : Data
    var total : Double
    let session : URLSession
    var image : UIImage?
}

final class NasaImageLoadViewController : UIViewController {
    // MARK: - UI
    let viewManager = NasaImageLoadView()
    
    // MARK: - Properties
    var nasaData : [NasaData]? {
        didSet{
            viewManager.nasaImageCollectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupDelegate()
        setupAddTarget()
    }
    

    // MARK: - SetupDelegate
    private func setupDelegate(){
        viewManager.nasaImageCollectionView.dataSource = self
        viewManager.nasaImageCollectionView.delegate = self
        
        viewManager.nasaImageCollectionView.register(NasaImageCollectionViewCell.self, forCellWithReuseIdentifier: NasaImageCollectionViewCell.identifier)
    }
    
    // MARK: - AddTarget
    private func setupAddTarget() {
        viewManager.requestButton.addTarget(self, action: #selector(requestBUttonTapped), for: .touchUpInside)
        
        
    }
    // MARK: - EventSelector
    @objc private func requestBUttonTapped(){
        nasaData = [
            NasaData(imageURL: Nasa.photo, loadingBuffer: Data(), total: 0, session: URLSession(configuration: .default, delegate: self, delegateQueue: .main), image : nil),
            NasaData(imageURL: Nasa.photo, loadingBuffer: Data(), total: 0, session: URLSession(configuration: .default, delegate: self, delegateQueue: .main), image : nil),
            NasaData(imageURL: Nasa.photo, loadingBuffer: Data(), total: 0, session: URLSession(configuration: .default, delegate: self, delegateQueue: .main), image : nil),
            NasaData(imageURL: Nasa.photo, loadingBuffer: Data(), total: 0, session: URLSession(configuration: .default, delegate: self, delegateQueue: .main), image : nil),
            NasaData(imageURL: Nasa.photo, loadingBuffer: Data(), total: 0, session: URLSession(configuration: .default, delegate: self, delegateQueue: .main), image : nil),
            NasaData(imageURL: Nasa.photo, loadingBuffer: Data(), total: 0, session: URLSession(configuration: .default, delegate: self, delegateQueue: .main), image : nil),
        ]
        
        fetchNasaImage()
    }
    
    // MARK: - SetupUI
    // MARK: - APIFetch
    private func fetchNasaImage() {
        guard let nasaData else {return }
        nasaData.forEach{
            let request = URLRequest(url: $0.imageURL)
            $0.session.dataTask(with: request).resume()
        }

    }
    
    
    // MARK: - PageTransition
}




extension NasaImageLoadViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let nasaData else {return 0}
        return nasaData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NasaImageCollectionViewCell.identifier, for: indexPath) as! NasaImageCollectionViewCell
        guard let nasaData else {return cell}
        
        let data = nasaData[indexPath.row]
        cell.configureData(data: data)
        
        return cell
    }
}


extension NasaImageLoadViewController : URLSessionDataDelegate {
    
    //최초로 응답받았을 때
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        guard let nasaData else {return .cancel}
        
        for (index, item) in nasaData.enumerated() {
            if item.session == session {

                if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode){
                    
                    //총 데이터 가져와야함-> 헤더의 content length
                    let contentLength = response.value(forHTTPHeaderField: "Content-Length")!
                    self.nasaData![index].total = Double(contentLength)!
                    
                    return .allow
                } else {
                    return .cancel
                }
            }
        }
        return .allow

    }
    
    
    //데이터 받아올때마다 반복적 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard let nasaData else {return }
        
        for (index, item) in nasaData.enumerated()  {
            if item.session == session {
                self.nasaData![index].loadingBuffer.append(data)
            }
        }

    }
    
    //데이터 다 받아 왔을 때!
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        
        guard let nasaData else {return }
        
        for (index, item) in nasaData.enumerated()  {
            if item.session == session {
                
                if error != nil {
                    print("error => ", error)
                }else {
                    self.nasaData![index].image = UIImage(data: nasaData[index].loadingBuffer)
                }
            }
        }
        

    }
    
    
}





