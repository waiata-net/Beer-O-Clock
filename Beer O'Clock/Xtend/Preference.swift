//
//  Preference.swift
//
//  Created by Neal Watkins on 22/02/2025.
//

import Foundation

@propertyWrapper
struct Preference<T: Codable> {
    
    var store: UserDefaults = .standard
    var key: String
    var def: T
    
    var wrappedValue: T {
        get {
            if let value = store.object(forKey: key) as? T {
                return value
            }
            else if let data = store.data(forKey: key),
                    let decoded = try? PropertyListDecoder().decode(T.self, from: data) {
                return decoded
            } else {
                return def
            }
        }
        set {
            if isStandard {
                store.set(newValue, forKey: key)
            } else if let data = try? PropertyListEncoder().encode(newValue) {
                
            }
        }
    }
    
    var isStandard: Bool {
        def is Bool || def is Int || def is Float || def is Double || def is String || def is URL
    }
                
}


extension Preference where T: ExpressibleByNilLiteral {
    init(key: String, store: UserDefaults = .standard) {
        self.init(store: store, key: key, def: nil)
    }
}
