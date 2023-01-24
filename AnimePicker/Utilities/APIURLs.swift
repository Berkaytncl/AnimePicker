//
//  APIURLs.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 17.01.2023.
//

import Foundation

enum APIURLs {
    private static let baseURL = "https://api.jikan.moe/v4"
    
    static let randomAnime = "\(baseURL)/random/anime"
    
    static func topAnimes(page: Int) -> String {
        "\(baseURL)/top/anime?page=\(page)"
    }
    
    static func selectedAnime(id: Int) -> String {
        "\(baseURL)/anime/\(id)"
    }
    
    
    
    static let recommendations = "\(baseURL)/recommendations/anime"
    
    static func topCharacters(page: Int) -> String {
        "\(baseURL)/top/characters?page=\(page)"
    }
}
