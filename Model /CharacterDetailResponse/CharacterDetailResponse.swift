//
//  CharacterDetailResponse.swift
//  DragonBall_SwiftUI
//
//  Created by LUIS GONZALEZ on 12/09/24.
//

import Foundation


struct CharacterDetailResponse: Codable {
    let id: Int
    let name, ki, maxKi, race: String
    let gender, description: String
    let image: String
    let affiliation: String
    let originalPlanet: OriginalPlanet
    let transformations: [Transformation]
}

struct OriginalPlanet: Codable {
    let id: Int
    let name: String
    let isDesttroyed: Bool
    let description: String
    let image: String
  
}

struct Transformation: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let ki: String
}
