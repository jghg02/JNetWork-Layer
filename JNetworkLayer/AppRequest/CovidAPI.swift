//
//  CovidAPI.swift
//  JNetworkLayer
//
//  Created by Josue German Hernandez Gonzalez on 04-07-21.
//

import Foundation

struct CovidAPIQueryParams {
    let yesterday: Bool = true
}


/// This API will hold all API's related to COVID19
enum CovidAPI {
    case getAllCountries(CovidAPIQueryParams)
}

extension CovidAPI: APIProtocol {
    func httpMthodType() -> HTTPMethodType {
        var methodType = HTTPMethodType.get
        switch self {
        case .getAllCountries(_):
            methodType = .get
        }
        return methodType
    }
    
    func apiEndPath() -> String {
        var path = ""
        switch self {
        case .getAllCountries(_):
            path += JNWebserviceConstants.countriesAPI
        }
        
        return path
    }
    
    func apiBasePath() -> String {
        switch self {
        case .getAllCountries(_):
            return JNWebserviceConstants.baseURL
        }
    }
    
    
}
