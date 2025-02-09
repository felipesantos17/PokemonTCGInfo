//
//  PokemonCardService.swift
//  PokemonTCGInfos
//
//  Created by Felipe Santos on 08/02/25.
//

import Foundation
import Alamofire
import Combine

protocol PokemonCardServiceProtocol {
    func fetchPokemonCards(page: Int, pageSize: Int) -> AnyPublisher<[CardInfoListResponse], Error>
}

class PokemonCardService: PokemonCardServiceProtocol {
    private let apiKey = "5bcaba8a-2b45-41a7-bd52-0f8ea5ffa70c"
    private let baseURL = "https://api.pokemontcg.io/v2/cards"

    func fetchPokemonCards(page: Int, pageSize: Int) -> AnyPublisher<[CardInfoListResponse], Error> {
        let url = "\(baseURL)?page=\(page)&pageSize=\(pageSize)"
        let headers: HTTPHeaders = ["X-Api-Key": apiKey]

        return AF.request(url, headers: headers)
            .validate()
            .publishDecodable(type: ListCardResponse.self)
            .value()
            .map { $0.cardList ?? [] }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
