//
//  DatosPokemon.swift
//  PokeDex_IOS
//
//  Created by Esteban Jiménez on 2023-08-23.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
}
