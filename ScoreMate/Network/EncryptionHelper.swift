//
//  EncryptionHelper.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 17.03.2025.
//

import CryptoKit
import Foundation

struct EncryptionHelper {
//    static let key = SymmetricKey(size: .bits256)

    static let key = SymmetricKey(data: Data(base64Encoded: "nMrZOXk3tn2iJ346lta7IXkb0GHHTHupj2SMvW73dHw=")!)
    
    static func encrypt(text: String) -> String? {
        guard let data = text.data(using: .utf8) else { return nil }
        
        do {
            let sealedBox = try AES.GCM.seal(data, using: key)
            return sealedBox.combined?.base64EncodedString() // Save only the encrypted Base64 string
        } catch {
            print("Encryption failed: \(error)")
            return nil
        }
    }
    
    static func decrypt(base64Ciphertext: String) -> String? {
        guard let encryptedData = Data(base64Encoded: base64Ciphertext) else { return nil }
        
        do {
            let sealedBox = try AES.GCM.SealedBox(combined: encryptedData)
            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return String(data: decryptedData, encoding: .utf8)
        } catch {
            print("Decryption failed: \(error)")
            return nil
        }
    }
}
