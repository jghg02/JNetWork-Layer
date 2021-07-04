//
//  CovidServicesRequest.swift
//  JNetworkLayer
//
//  Created by Josue German Hernandez Gonzalez on 04-07-21.
//

import Foundation

typealias GetAllCountriesResponse = (Result<[Country], Error>) -> Void

protocol CovidServiceRequestType {
    @discardableResult func getAllCountries(apiQueryModel: CovidAPIQueryParams, completion: @escaping GetAllCountriesResponse) -> URLSessionDataTask?
}

struct CovidServicesRequest: CovidServiceRequestType {
    func getAllCountries(apiQueryModel: CovidAPIQueryParams, completion: @escaping GetAllCountriesResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: CovidAPI.getAllCountries(apiQueryModel))
        return JNWebserviceHelper.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let data):
                JNJSONResponseDecoder.decodeFrom(data, returningModelType: [Country].self, completion: { (allData, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }
                    
                    if let data = allData {
                        completion(.success(data))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
                }
            }
        }
}

