//
//  APIHandler.swift
//  SWAPI
//
//  Created by Stephen Byatt on 5/10/21.
//

import Foundation
import Alamofire
import UIKit

class SWAPI {
    
    static var basePath = "https://swapi.dev/api/"
    
    static let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })
        return Session(
            configuration: configuration,
            cachedResponseHandler: responseCacher
        )
    }()
    
    static func getPerson(from url: String, handler: @escaping (Person?) -> Void) {
        sessionManager.request(url, method: .get).responseDecodable(of: Person.self) { response in
            switch response.result {
            case .success:
                handler(response.value)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    static func getFilms(handler: @escaping ([Film]?) -> Void) {
        let path = basePath + "films"
        sessionManager.request(path, method: .get).responseDecodable(of: FilmsResponse.self) { response in
            switch response.result {
            case .success:
                handler(response.value?.results)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
    
    static func getStarshipsForPage(pageURL: String, handler: @escaping (String?, [Starship]) -> Void) {
        sessionManager.request(pageURL, method: .get).responseDecodable(of: StarshipsResponse.self) { response in
            switch response.result {
            case .success:
                guard let val = response.value else {
                    handler(nil, [])
                    return
                }
                
                handler(val.next, val.results ?? [])
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
