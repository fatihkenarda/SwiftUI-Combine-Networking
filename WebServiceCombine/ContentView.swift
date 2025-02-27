//
//  ContentView.swift
//  WebServiceCombine
//
//  Created by Fatih Kenarda on 12.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Kullanıcılar")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}


#Preview {
    ContentView()
}
