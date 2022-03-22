//
//  PrfileModel.swift
//  inSooqApp
//
//  Created by Abdullah AL-Soubani on 30/12/2021.
//

import Foundation

@propertyWrapper
public struct UserDefault<T: Codable> {
    private let key: String
    private let defaultValue: T?
    var userDefaults: UserDefaults
    
    public init(
        key: String,
        defaultValue: T? = .none,
        userDefaults: UserDefaults = .standard
    ) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
    }

    public var wrappedValue: T? {
        get {
            guard let data = userDefaults.object(forKey: key) as? Data else { return nil }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value
        } set {
            let data = try? JSONEncoder().encode(newValue)
            userDefaults.set(data, forKey: key)
        }
    }
}


public enum User {
    @UserDefault(key: "User")
    public static var profile: LoginModel?
}
