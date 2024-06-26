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
    func getMovieTrendData(handler : @escaping (MovieTrend)->Void)
    func getMovieCreditData(movieID : Int, handler: @escaping (MovieCredit) -> Void) -> Void
    func getMovieGenreData(handler : @escaping (MovieGenre)->Void) -> Void
    func getMovieSearchData(text : String, page: Int, handler : @escaping (MovieSearch)->Void) -> Void
}


class APIFetcher {
    static let shared = APIFetcher()
    private init(){}
    
    func getSingle<T : Decodable>(
        model : T.Type,
        requestType : NetworkRequest,
        completionHandler : @escaping (T) -> Void,
        errorHandler : @escaping ()->Void = {}
    ) {
        
        AF.request(
            requestType.endpoint,
            method: requestType.method,
            parameters: requestType.parameters,
            encoding : requestType.encoding,
            headers: requestType.headers
        )
//            .responseString{ data in
//                print(data)
//            }
            .responseDecodable(of: T.self) {response in
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
        /*
        getSingle(model: Lotto.self, url: "\(APIURL.lottoURL)\(episode)"){ value in
            handler(value)
        }
         */
    }
    
    func getBoxOfficeData(targetDate: String, handler: @escaping (BoxOffice) -> Void, errorHandler : @escaping ()->Void) {
        /*
        let queryParamDictionary = ["key":APIKey.koficKey, "targetDt":targetDate]
        
        getSingle(model: BoxOffice.self, url: "\(APIURL.boxofficeURL)\(queryParamDictionary.queryString)"){ value in
            handler(value)
        } errorHandler: {
            errorHandler()
        }
        */
    }
    
    func getMovieTrendData(handler: @escaping (MovieTrend) -> Void) {
        let requestType = NetworkRequest.getMovieTrendData
        getSingle(model: MovieTrend.self,requestType : requestType){ value in
            handler(value)
        }
    }
    
    func getMovieCreditData(movieID : Int, handler: @escaping (MovieCredit) -> Void) {
        let requestType = NetworkRequest.getMovieCreditData(movieId: String(movieID))
        getSingle(model: MovieCredit.self, requestType : requestType){ value in
            handler(value)
        }
    }
    
    
    func getMovieGenreData(handler: @escaping (MovieGenre) -> Void) {
        let requestType = NetworkRequest.getMovieGenreData
        getSingle(model: MovieGenre.self,requestType : requestType){ value in
            handler(value)
        }
    }
    
    
    func getMovieSearchData(text : String, page : Int, handler: @escaping (MovieSearch) -> Void) {
        let requestType = NetworkRequest.getMovieSearchData(query: text, page: String(page))
        getSingle(model: MovieSearch.self, requestType : requestType){ value in
            handler(value)
        }
    }
    
    
    
    func getRecommendationMovieData(type: MovieRecommendationType, movieId : Int, handler: @escaping (MovieRecommendaion) -> Void) {
        let requestType = NetworkRequest.getRecommendationMovieData(movieId: String(movieId), recommendationType: type.typeString)
        getSingle(model: MovieRecommendaion.self, requestType : requestType){ value in
            handler(value)
        }
    }
}
