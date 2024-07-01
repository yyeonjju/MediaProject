//
//  NasaImageLoadViewController.swift
//  MediaProject
//
//  Created by 하연주 on 7/1/24.
//

import UIKit

struct NasaData {
    let imageURL : URL
//    let loadingBuffer : Data
//    let total : Double
//    let session : URLSession
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
        
        print("💚💚💚nasaData -> ", nasaData)
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
            NasaData(imageURL: Nasa.photo),
            NasaData(imageURL: Nasa.photo),
            NasaData(imageURL: Nasa.photo),
            NasaData(imageURL: Nasa.photo),
            NasaData(imageURL: Nasa.photo),
            NasaData(imageURL: Nasa.photo),
        ]
    }
    
    // MARK: - SetupUI
    // MARK: - APIFetch
    private func fetchNasaImage() {
//        nasaData.forEach{
//            let request = URLRequest(url: $0.imageURL)
//            $0.session.dataTask(with: request).resume()
//        }

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
        cell.configureData(data: data, row : indexPath.row)
        
        return cell
    }
}




