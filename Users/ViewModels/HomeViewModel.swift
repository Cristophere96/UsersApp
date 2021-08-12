//
//  HomeViewModel.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var showSheet = false
    @Published var user: Users!
    @Published var isLoading = false
    @Published var input = ""
    var items: [Int] = []
    
    func fetchUsers(context: NSManagedObjectContext) {
        self.isLoading = true
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let json = try JSONDecoder().decode([User].self, from: data!)
                
                for user in json {
                    if self.items.contains(user.id) {
                        return
                    } else {
                        self.items.append(user.id)
                        let newUser = Users(context: context)
                        newUser.id = "\(user.id)"
                        newUser.name = user.name
                        newUser.email = user.email
                        newUser.phone = user.phone
                        
                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }.resume()
    }
    
    func presentSheet(user: Users) {
        self.user = user
        self.showSheet.toggle()
    }
}
