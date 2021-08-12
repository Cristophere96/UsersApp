//
//  User.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI

struct User: Decodable {
    var id: Int
    var name: String
    var email: String
    var phone: String
}
