//
//  ListCardResponse.swift
//  PokemonTCGInfos
//
//  Created by Felipe Santos on 13/01/25.
//

import Foundation

struct ListCardResponse: Codable {
    let cardList: [CardInfoListResponse]?
    let page, pageSize, count, totalCount: Int?
    enum CodingKeys: String, CodingKey {
        case page, pageSize, count, totalCount
        case cardList = "data"
    }
}


