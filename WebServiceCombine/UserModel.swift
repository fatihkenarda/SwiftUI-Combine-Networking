//
//  UserModel.swift
//  WebServiceCombine
//
//  Created by Fatih Kenarda on 12.02.2025.
//

import Foundation

struct User: Codable, Identifiable{
    let id: Int
    let name: String
    let email: String
}
