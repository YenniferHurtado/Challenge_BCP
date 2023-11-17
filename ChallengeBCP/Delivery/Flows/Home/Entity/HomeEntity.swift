//
//  HomeEntity.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 16/11/23.
//

import Foundation

struct HomeEntity: Decodable {
    var success: Bool
    var timestamp: Int
    var base: String
    var date: String
    let rates: [String: Double]
}
