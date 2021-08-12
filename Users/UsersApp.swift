//
//  UsersApp.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI

@main
struct UsersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
