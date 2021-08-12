//
//  PostsView.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI

struct PostsView: View {
    var user: Users
    @ObservedObject var postsVM = PostsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    PostUserOwner(user: user)
                    Spacer()
                }
                Divider()
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(postsVM.posts, id: \.id) { post in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(post.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text(post.body)
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .lineLimit(nil)
                            }
                            .padding()
                            .background(
                                Color("Font").opacity(0.05)
                            )
                            .cornerRadius(10)

                        }
                    }
                }
                .animation(.easeInOut)
            }
            .padding()
            .navigationTitle("User posts")
            .onAppear(){
                postsVM.fetchPosts(userId: user.id!)
            }
        }
    }
}
