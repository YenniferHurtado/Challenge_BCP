//
//  Feed.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//

import Foundation

enum Feed {
    case listRates
}

extension Feed: Endpoint {
        
    var httpMethod: RequestMethod {
        switch self {
        case .listRates:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .listRates:
            return "/v1/latest"
        }
    }
}
