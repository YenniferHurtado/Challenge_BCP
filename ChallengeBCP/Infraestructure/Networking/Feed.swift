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

let api_key = "e4129947a0ee3ef5e8513ac524cf017c"

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
