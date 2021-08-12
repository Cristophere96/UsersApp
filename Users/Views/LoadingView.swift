//
//  LoadingView.swift
//  Users
//
//  Created by Cristopher Escorcia on 12/08/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Spacer()
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(3)
        Spacer()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
