//
//  KeychainSwift+Extension.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 16/11/23.
//

import Foundation
import KeychainSwift

class KeychainLoadHash {
    static func getkey() -> String? {
        let keychain = KeychainSwift()
        return keychain.get("challenge.bcp.key")
    }
}

struct KeychainSaveHash {
    func save() {
        let keychain = KeychainSwift()
        keychain.set("e4129947a0ee3ef5e8513ac524cf017c", forKey: "challenge.bcp.key")
    }
}

struct KeychainRemoveHash {
    func remove() {
        let keychain = KeychainSwift()
        keychain.delete("challenge.bcp.key")
    }
}

