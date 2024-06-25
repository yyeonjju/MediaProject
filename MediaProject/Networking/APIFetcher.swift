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
    
    let tmdbBaseHeader  : HTTPHeaders = [
        "Authorization" : "Bearer \(APIKey.tmdbAccessToken)",
        "accept" : "application/json"
    ]
    
    func getSingle<T : Decodable>(
        model : T.Type,
        url : String,
        headers : HTTPHeaders = [],
        completionHandler : @escaping (T) -> Void,
        errorHandler : @escaping ()->Void = {}
    ) {
        print("url❤️", url)
        AF.request(url, method: .get, headers: headers)
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
    
    func getMovieTrendData(handler: @escaping (MovieTrend) -> Void) {
        getSingle(model: MovieTrend.self, url: APIURL.tmdbMovietTrendURL, headers: tmdbBaseHeader){ value in
            handler(value)
        }
    }
    
    func getMovieCreditData(movieID : Int, handler: @escaping (MovieCredit) -> Void) {
        
        getSingle(model: MovieCredit.self, url: "\(APIURL.tmdbMovieCreditURL)\(movieID)/credits", headers: tmdbBaseHeader){ value in
            handler(value)
        }
    }
    
    
    func getMovieGenreData(handler: @escaping (MovieGenre) -> Void) {
        getSingle(model: MovieGenre.self, url: "\(APIURL.tmdbMovieGenreURL)", headers: tmdbBaseHeader){ value in
            handler(value)
        }
    }
    
    
    func getMovieSearchData(text : String, page : Int, handler: @escaping (MovieSearch) -> Void) {
        let queryParamDictionary = ["query": text, "page" : String(page)]
        
        getSingle(model: MovieSearch.self, url: "\(APIURL.tmbdMovieSearchURL)\(queryParamDictionary.queryString)", headers: tmdbBaseHeader){ value in
            handler(value)
        }
    }
    
    
    
    func getRecommendationMovieData(type: MovieRecommendationType, movieId : Int, handler: @escaping (MovieRecommendaion) -> Void) {
        let url = APIURL.tmbdRecommendationMovieURL.replacingOccurrences(of: "{movieId}", with: String(movieId)).replacingOccurrences(of: "{recommendationType}", with: type.rawValue)
        getSingle(model: MovieRecommendaion.self, url: url, headers: tmdbBaseHeader){ value in
            handler(value)
        }
    }
}
