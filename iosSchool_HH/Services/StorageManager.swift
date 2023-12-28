//
//  StorageManager.swift
//  iosSchool_HH
//
//  Created by student on 04.12.2023.
//

import Foundation
import KeychainAccess

protocol StorageManager {
    func cleanKeychainIfNeeded()
    func saveToken(token: TokenResponse)
    func getToken() -> TokenResponse?
    func removeToken()
    func saveLastAuthDate()
    func getLastAuthDate() -> String?
}

class StorageManagerImp: StorageManager {

    private let keychain = Keychain(service: Constants.serviceId)

    func cleanKeychainIfNeeded() {
        guard !notFirstLaunch() else {
            return
        }
        do {
            try keychain.removeAll()
        } catch {
            print(error as Any)
        }
        saveFirstLaunch()
    }

    func saveToken(token: TokenResponse) {
        do {
            try keychain.set(token.token, key: StorageManagerKey.token.rawValue)
            try keychain.set(token.userId, key: StorageManagerKey.userId.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func getToken() -> TokenResponse? {
        do {
            guard let token = try keychain.get(StorageManagerKey.token.rawValue) else {
                return nil
            }
            guard let userId = try keychain.get(StorageManagerKey.userId.rawValue) else {
                return nil
            }
            return TokenResponse(token: token, userId: userId)
        } catch {
            print(error as Any)
        }
        return nil
    }

    func removeToken() {
        do {
            try keychain.remove(StorageManagerKey.token.rawValue)
            try keychain.remove(StorageManagerKey.userId.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func saveLastAuthDate() {
        UserDefaults.standard.set(Date(), forKey: StorageManagerKey.lastAuthDate.rawValue)
    }

    func getLastAuthDate() -> String? {
        guard let date = UserDefaults.standard.object(forKey: StorageManagerKey.lastAuthDate.rawValue) as? Date else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}

private extension StorageManagerImp {
    enum StorageManagerKey: String {
        case token
        case userId
        case notFirstLaunch
        case lastAuthDate
    }

    struct Constants {
        static let serviceId = "StorageManagerKeyChain.Service.Id"
    }

    func notFirstLaunch() -> Bool {
        UserDefaults.standard.bool(forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }

    func saveFirstLaunch() {
        UserDefaults.standard.set(true, forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }
}
