//
//  APIURLs.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 17.01.2023.
//

import Foundation

enum APIURLs {
    private static let baseURL = "https://api.jikan.moe/v4"
    
    static let topAnimes = "\(baseURL)/top/anime"
    static let randomAnime = "\(baseURL)/random/anime"
}
