//
//  RequestError.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//

import Foundation

struct RequestError: Decodable, Error {
    let message: String
    static let `default`: RequestError = RequestError(message: "Ocurrio un error inesperado")
}
