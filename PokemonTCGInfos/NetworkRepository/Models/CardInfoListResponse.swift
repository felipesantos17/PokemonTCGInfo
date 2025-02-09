//
//  CardInfoListResponse.swift
//  PokemonTCGInfos
//
//  Created by Felipe Santos on 08/02/25.
//

import Foundation

struct CardInfoListResponse: Codable, Hashable {
    let id: String?
    let name: String?
    let supertype: String?
    let subtypes: [String]?
    let hp: String?
    let attacks: [PokemonAttacks]?
    let weaknesses: [WeaknessesAndResistances]?
    let resistances: [WeaknessesAndResistances]?
    let images: CardImages?
    let tcgplayer: TCGPlayer?
    
    struct PokemonAttacks: Codable, Hashable {
        let name: String?
        let cost: [String]?
        let convertedEnergyCost: Int?
        let damage: String?
        let text: String?
    }
    
    struct WeaknessesAndResistances: Codable, Hashable {
        let type: String?
        let value: String?
    }
    
    struct CardImages: Codable, Hashable {
        let small: String?
        let large: String?
    }
    
    struct TCGPlayer: Codable, Hashable {
        let url: String?
    }
}
