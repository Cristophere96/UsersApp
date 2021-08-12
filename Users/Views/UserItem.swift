//
//  UserItem.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI

struct UserItem: View {
    var user: Users
    var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(user.name ?? "")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                Text(user.phone ?? "")
            }
            
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.blue)
                Text(user.email ?? "")
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    viewModel.presentSheet(user: user)
                }, label: {
                    Text("VER PUBLICACIONES")
                })
            }
        }
        .padding()
        .background(
            Color("Font").opacity(0.05)
        )
        .cornerRadius(10)
    }
}
