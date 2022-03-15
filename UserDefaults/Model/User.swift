//
//  Model.swift
//  UserDefaults
//
//  Created by Николай Петров on 15.03.2022.
//

import Foundation

struct User: Encodable, Decodable {
    var name = "User"
    var surname = "Name"
    
    var encoded: Data? {
        let encoder = PropertyListEncoder()
        return try? encoder.encode(self)
    }
    
    init?(from data: Data) {
        let decoder = PropertyListDecoder()
        guard let user = try? decoder.decode(User.self, from: data) else { return nil }
        name = user.name
        surname = user.surname
    }
    
    init() {}
}
