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
    func getBoxOfficeData(targetDate: String, handler : @escaping (BoxOffice)->Void, errorHandler : @escaping ()->Void) -> Void
}


class APIFetcher {
    func getSingle<T : Decodable>(model : T.Type, url : String, completionHandler : @escaping (T) -> Void, errorHandler : @escaping ()->Void = {}) {
        AF.request(url).responseDecodable(of: T.self) {response in
            print(response)
            switch response.result {
            case .success(let value) :
                print("success❤️", value)
                completionHandler(value)
            case .failure(let error) :
                print("error💚", error)
                errorHandler()
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
    
    func getBoxOfficeData(targetDate: String, handler: @escaping (BoxOffice) -> Void, errorHandler : @escaping ()->Void) {
        let queryParamDictionary = ["key":APIKey.koficKey, "targetDt":targetDate]
        
        getSingle(model: BoxOffice.self, url: "\(APIURL.boxofficeURL)\(queryParamDictionary.queryString)"){ value in
            handler(value)
        } errorHandler: {
            errorHandler()
        }
    }
    
}
