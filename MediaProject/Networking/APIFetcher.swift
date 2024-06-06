//
//  APIFetcher.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import Foundation
import Alamofire

protocol APIFetchable {
    func getLottoInfo(episode: Int, handler : @escaping (Lotto?)->Void) -> Void
}


class APIFetcher {
    func getSingle<T : Decodable>(model : T.Type, url : String, completionHandler : @escaping (T) -> Void) {
        AF.request(url).responseDecodable(of: T.self) {response in
            print(response)
            switch response.result {
            case .success(let value) :
                print("success❤️", value)
                completionHandler(value)
            case .failure(let error) :
                print("error💚", error)
            }
        }
    }

}


extension APIFetcher : APIFetchable{
    func getLottoInfo(episode : Int, handler: @escaping (Lotto?) -> Void) {
        getSingle(model: Lotto.self, url: "\(APIURL.lottoURL)\(episode)"){ value in
            handler(value)
        }
    }
}
