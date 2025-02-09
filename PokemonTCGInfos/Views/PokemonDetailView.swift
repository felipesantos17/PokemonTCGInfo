//
//  PokemonDetailView.swift
//  PokemonTCGInfos
//
//  Created by Felipe Santos on 08/02/25.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: CardInfoListResponse

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                cardImage()
                cardInfo()
                attacksSection()
                weaknessesAndResistances()
                tcgPlayerLink()
            }
            .padding()
        }
        .navigationTitle(pokemon.name ?? "Card Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func cardImage() -> some View {
        AsyncImage(url: URL(string: pokemon.images?.large ?? "")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 350, height: 450)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    @ViewBuilder
    private func cardInfo() -> some View {
        VStack(spacing: 8) {
            Text(pokemon.name ?? "Unknown")
                .font(.title)
                .bold()
                .foregroundStyle(.brown)
            
            Text("\(pokemon.supertype ?? "Unknown") - \(pokemon.subtypes?.joined(separator: ", ") ?? "")")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("HP: \(pokemon.hp ?? "0")")
                .font(.headline)
                .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func attacksSection() -> some View {
        if let attacks = pokemon.attacks, !attacks.isEmpty {
            VStack(alignment: .leading, spacing: 10) {
                Text("Attacks")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                ForEach(attacks, id: \.name) { attack in
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(attack.name ?? "Unknown Attack") - \(attack.damage ?? "0")")
                            .font(.subheadline)
                            .bold()
                        Text(attack.text ?? "")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func weaknessesAndResistances() -> some View {
        HStack(spacing: 20) {
            if let weaknesses = pokemon.weaknesses, !weaknesses.isEmpty {
                VStack {
                    Text("Weakness")
                        .font(.headline)
                    Text(weaknesses.map { "\($0.type ?? "Unknown") \($0.value ?? "")" }.joined(separator: ", "))
                        .font(.subheadline)
                }
            }
            if let resistances = pokemon.resistances, !resistances.isEmpty {
                VStack {
                    Text("Resistance")
                        .font(.headline)
                    Text(resistances.map { "\($0.type ?? "Unknown") \($0.value ?? "")" }.joined(separator: ", "))
                        .font(.subheadline)
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func tcgPlayerLink() -> some View {
        if let url = pokemon.tcgplayer?.url, let linkURL = URL(string: url) {
            Link("View on TCGPlayer", destination: linkURL)
                .font(.headline)
                .foregroundColor(.blue)
                .padding()
        }
    }
}

#Preview {
    PokemonDetailView(
        pokemon: .init(
            id: "hgss4-1",
            name: "Aggron",
            supertype: "Pokémon",
            subtypes: ["Stage 2"],
            hp: "140",
            attacks: [
                .init(
                    name: "Second Strike",
                    cost: [
                        "Metal",
                        "Metal",
                        "Colorless"
                    ],
                    convertedEnergyCost: 3,
                    damage: "40",
                    text: "If the Defending Pokémon already has any damage counters on it, this attack does 40 damage plus 40 more damage."
                ),
                .init(
                    name: "Guard Claw",
                    cost: [
                        "Metal",
                        "Metal",
                        "Colorless",
                        "Colorless"
                    ],
                    convertedEnergyCost: 4,
                    damage: "40",
                    text: "During your opponent's next turn, any damage done to Aggron by attacks is reduced by 20 (after applying Weakness and Resistance)."
                )
            ],
            weaknesses: [
                .init(type: "Fire", value: "×2")
            ],
            resistances: [
                .init(type: "Psychic", value: "-20")
            ],
            images: .init(small: "https://images.pokemontcg.io/hgss4/1.png", large: "https://images.pokemontcg.io/hgss4/1_hires.png"),
            tcgplayer: .init(url: "https://prices.pokemontcg.io/tcgplayer/hgss4-1")
        )
    )
}
