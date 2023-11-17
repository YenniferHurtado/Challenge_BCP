//
//  HomeInteractorTests.swift
//  ChallengeBCPTests
//
//  Created by Yennifer Hurtado Arce on 17/11/23.
//

import XCTest
import Combine

@testable import ChallengeBCP

class MockHomeDependencies: HomeInteractorDependenciesProtocol {
    
    var listedRatesReturnValue: Result<HomeEntity, RequestError>!

    func listRates(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<HomeEntity, RequestError> {
        return Result.Publisher(listedRatesReturnValue).eraseToAnyPublisher()
    }
}

class HomeInteractorTestsCase: XCTestCase {
    
    var sut: HomeInteractor!
    var dependencies: MockHomeDependencies!
    
    override func setUp() {
        super.setUp()
        dependencies = MockHomeDependencies()
        sut = HomeInteractor(dependencies: dependencies)
    }
    
    override func tearDown() {
        sut = nil
        dependencies = nil
        super.tearDown()
    }
    
    func testListedRates() {
        
        let expectedQuery = [URLQueryItem(name: "access_key", value: KeychainLoadHash.getkey())]
        
        let expectedResult: Result<HomeEntity, RequestError> = .success(CreateObjectList.mockItems)
        dependencies.listedRatesReturnValue = expectedResult
        
        var completionResult: Result<HomeEntity, RequestError>?
        // When
        
        sut.listedRates(query: expectedQuery) { result in
            completionResult = result
        }
        
        // Then
        XCTAssertNotNil(dependencies.listedRatesReturnValue)
        
        if case let .success(success) = dependencies.listedRatesReturnValue {
            XCTAssertEqual(success.rates, CreateObjectList.mockItems.rates)
        } else {
            XCTFail("an unexpected error occurred")
        }
    }
    
    func testListedRatesError() {
        // Given
        let expectedQuery = [URLQueryItem(name: "access_key", value: KeychainLoadHash.getkey())]

        let expectedResult: Result<HomeEntity, RequestError> = .failure(RequestError.default)
        dependencies.listedRatesReturnValue = expectedResult
        
        var completionResult: Result<HomeEntity, RequestError>?
        // When
        
        sut.listedRates(query: expectedQuery) { result in
            completionResult = result
        }

        // Then
        XCTAssertNotNil(dependencies.listedRatesReturnValue)
                        
        if case let .failure(error) = dependencies.listedRatesReturnValue {
            XCTAssertEqual(error.message, "Ocurrio un error inesperado")
        } else {
            XCTFail("Expected unsuccessful response, but received success")
        }
    }
    
}
