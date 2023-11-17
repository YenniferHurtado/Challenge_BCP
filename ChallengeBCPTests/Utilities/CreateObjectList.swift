//
//  CreateObjectList.swift
//  ChallengeBCPTests
//
//  Created by Yennifer Hurtado Arce on 17/11/23.
//

import Foundation
import ChallengeBCP

struct CreateObjectList {
    
    static var mockItems: HomeEntity {
        let data = String.json(fromFile: "elements", bundle: BundleTest.bundleTest)
        let decoder = JSONDecoder()
        let decodable  = try! decoder.decode(HomeEntity.self, from: data)
        return decodable
    }
    
    static var items: Data {
        let data = String.json(fromFile: "elements", bundle: BundleTest.bundleTest)
        return data
    }
    
}

extension String {
    static func json(fromFile: String, bundle: Bundle) -> Data {
        let data = Data(jsonFileName: fromFile, bundle: bundle)
        return data
    }
}

extension Data {
    init(jsonFileName: String, bundle: Bundle = Bundle.main) {
        do {
            if let file = bundle.url(forResource: jsonFileName, withExtension: "json") {
                try self.init(contentsOf: file)
                return
            }
        } catch {
            print(error.localizedDescription)
        }
        self.init()
    }
}
