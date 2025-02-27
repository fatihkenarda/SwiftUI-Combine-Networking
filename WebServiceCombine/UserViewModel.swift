//
//  UserViewModel.swift
//  WebServiceCombine
//
//  Created by Fatih Kenarda on 12.02.2025.
//

import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []  // API’den gelen veriyi burada saklayacağız
    private var cancellables = Set<AnyCancellable>()

    func fetchUsers() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) // Gelen yanıtın sadece data kısmını al
            .decode(type: [User].self, decoder: JSONDecoder()) // JSON verisini User dizisine çevir
            .receive(on: DispatchQueue.main) // UI güncellemeleri için ana thread’e al
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Hata: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] users in
                self?.users = users
            })
            .store(in: &cancellables)
    }
}

