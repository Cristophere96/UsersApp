//
//  HomeView.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @ObservedObject var homeVM = HomeViewModel()
    @FetchRequest(entity: Users.entity(), sortDescriptors: [],
                  animation: .spring()) var results: FetchedResults<Users>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        NavigationView {
            VStack {
                if results.isEmpty {
                    LoadingView()
                        .onAppear(){
                            if results.isEmpty {
                                homeVM.fetchUsers(context: context)
                            }
                        }
                } else {
                    VStack{
                        TextField("Buscar usuario", text: $homeVM.input)
                            .padding(10)
                            .background(Color("Font").opacity(0.05))
                            .cornerRadius(10)
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVStack(alignment: .leading, spacing: 20) {
                                ForEach(results.filter {
                                    (($0.name?.contains(homeVM.input))! || homeVM.input.isEmpty)
                                }, id: \.id) { user in
                                    UserItem(user: user, viewModel: homeVM)
                                }
                            }
                        }
                        .animation(.easeInOut)
                    }
                }
            }
            .navigationTitle("Users")
            .padding()
            .sheet(isPresented: $homeVM.showSheet, content: {
                PostsView(user: homeVM.user)
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
