//
//  HomeEntity.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 16/11/23.
//

import Foundation

struct HomeEntity: Codable {
    var success: Bool
    let rates: [String: Double]
}

