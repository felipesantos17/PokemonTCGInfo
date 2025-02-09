//
//  PokemonCardListView.swift
//  PokemonTCGInfos
//
//  Created by Felipe Santos on 12/01/25.
//

import SwiftUI

struct PokemonCardListView: View {
    @StateObject private var viewModel = PokemonCardViewModel()
    @State private var searchText: String = ""

    var filteredPokemonList: [CardInfoListResponse] {
        if searchText.isEmpty {
            return viewModel.pokemonCardList
        } else {
            return viewModel.pokemonCardList.filter { pokemon in
                pokemon.name?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            TextField("Buscar Pokémon", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.top)
            
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(filteredPokemonList, id: \.id) { pokemon in
                        NavigationLink(value: pokemon) {
                            Text(pokemon.name ?? "No name")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }

                    if viewModel.isLoading {
                        ProgressView("Carregando...")
                            .padding()
                    } else if let message = viewModel.errorMessage, !message.isEmpty {
                        Text(message)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        Color.clear
                            .frame(height: 50)
                            .onAppear {
                                if searchText.isEmpty {
                                    viewModel.loadMoreCards()
                                }
                            }
                    }
                }
            }
            .navigationTitle("Pokémon Cards")
            .onAppear {
                if searchText.isEmpty {
                    viewModel.getListCards()
                }
            }
            .navigationDestination(for: CardInfoListResponse.self) { pokemon in
                PokemonDetailView(pokemon: pokemon)
            }
        }
    }
}


#Preview {
    PokemonCardListView()
}
