//
//  Preference.swift
//
//  Created by Neal Watkins on 22/02/2025.
//

import Foundation

@propertyWrapper
struct Preference<T: RawRepresentable> {
    
    var store: UserDefaults = .standard
    var key: String
    var def: T
    
    var wrappedValue: T {
        get {
            guard let raw = store.value(forKey: key) as? T.RawValue
            else { return def }
            return T(rawValue: raw) ?? def
        }
        set {
            let raw = newValue.rawValue
            store.setValue(raw, forKey: key)
        }
    }
    
}

extension Preference where T: ExpressibleByNilLiteral {
    init(key: String, store: UserDefaults = .standard) {
        self.init(store: store, key: key, def: nil)
    }
}
