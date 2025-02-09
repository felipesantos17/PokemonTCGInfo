//
//  PokemonCardViewModel.swift
//  PokemonTCGInfos
//
//  Created by Felipe Santos on 08/02/25.
//

import Foundation
import Combine

class PokemonCardViewModel: ObservableObject {
    @Published var pokemonCardList: [CardInfoListResponse] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var currentPage = 1
    private let pageSize = 50
    private var cancellables = Set<AnyCancellable>()
    
    private let service: PokemonCardServiceProtocol
    
    init(service: PokemonCardServiceProtocol = PokemonCardService()) {
        self.service = service
    }

    func getListCards() {
        guard !isLoading else { return }
        isLoading = true

        service.fetchPokemonCards(page: currentPage, pageSize: pageSize)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                    case .failure(let error):
                        print("Erro ao buscar dados: \(error.localizedDescription)")
                        self?.errorMessage = error.localizedDescription
                        self?.isLoading = false
                    case .finished:
                        break
                }
            }, receiveValue: { [weak self] newCards in
                self?.pokemonCardList.append(contentsOf: newCards)
                self?.currentPage += 1
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }

    func loadMoreCards() {
        if !isLoading {
            getListCards()
        }
    }
}

