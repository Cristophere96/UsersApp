//
//  Posts.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
