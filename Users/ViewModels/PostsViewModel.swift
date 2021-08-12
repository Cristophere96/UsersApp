//
//  PostsViewModel.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    
    var items: [Int] = []
    
    func fetchPosts(userId: String) {
        self.isLoading = true
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let json = try JSONDecoder().decode([Post].self, from: data!)
                
                var tempPosts: [Post] = []
                
                for post in json {
                    if self.items.contains(post.id) {
                        return
                    } else {
                        self.items.append(post.id)
                        tempPosts.append(post)
                    }
                }
                
                DispatchQueue.main.async {
                    self.posts = tempPosts
                    self.isLoading = false
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
