//
//  MockHomeInteractorDependencies.swift
//  ChallengeBCPTests
//
//  Created by Yennifer Hurtado Arce on 17/11/23.
//

import Foundation
import Combine
@testable import ChallengeBCP

class MockHomeInteractorDependencies: HomeInteractorDependenciesProtocol {    

    var listedRatesCalled = false
    var listedRatesQuery: [URLQueryItem]?
    var listedRatesFeedKind: Feed?
    var listedRatesReturnValue: AnyPublisher<HomeEntity, RequestError>!
    
    func listRates(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<HomeEntity, RequestError> {
        listedRatesCalled = true
        listedRatesQuery = query
        listedRatesFeedKind = feedKind
        return listedRatesReturnValue
    }
}
