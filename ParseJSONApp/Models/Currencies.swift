//
//  Currencies.swift
//  ParseJSONApp
//
//  Created by Захар Князев on 14.12.2022.
//

struct Currency: Decodable {
    let id: String?
    let name: String?
    let min_size: Float?
}
