//
//  RequestMethod.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//

import Foundation

enum RequestMethod: String {
    case POST = "POST"
    case DELETE = "DELETE"
    case GET = "GET"
    case PUT = "PUT"
    
    var value: String {
        return rawValue
    }
}
