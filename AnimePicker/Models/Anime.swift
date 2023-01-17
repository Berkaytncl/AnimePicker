//
//  Anime.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 17.01.2023.
//

import Foundation

struct Anime: Decodable {
    let pagination: Pagination?
    let animeData: [AnimeData]?
    
    enum CodingKeys: String, CodingKey {
        case pagination = "has_next_page"
        case animeData = "data"
    }
}

struct Pagination: Decodable {
    let hasNextPage: Bool?
    let currentPage: Int?
    
    enum CodingKeys: String, CodingKey {
        case hasNextPage = "has_next_page"
        case currentPage = "current_page"
    }
    
    var _hasNextPage: Bool {
        hasNextPage ?? false
    }
    
    var _currentPage: Int {
        currentPage ?? -1
    }
}

struct AnimeData: Decodable {
    let id: Int?
    let images: Jpg?
    let title: String?
    let titleEnglish: String?
    let score: Float?
    let rank: Int?
    let synopsis: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case images
        case title
        case titleEnglish = "title_english"
        case score
        case rank
        case synopsis
    }
    
    var _id: Int {
        id ?? -1
    }
    
    var _images: Jpg {
        images ?? Jpg(jpg: JpgPath(imageUrl: ""))
    }
    
    var _title: String {
        title ?? "N/A"
    }
    
    var _titleEnglish: String {
        titleEnglish ?? "N/A"
    }
    
    var _score: Float {
        score ?? 0.0
    }
    
    var _rank: Int {
        rank ?? 0
    }
    
    var _synopsis: String {
        synopsis ?? "There is no synopsis"
    }
    
}

struct Jpg: Decodable {
    let jpg: JpgPath?
    
    var _jpg: JpgPath {
        jpg ?? JpgPath(imageUrl: "")
    }
}

struct JpgPath: Decodable {
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
    }
    
    var _imageUrl: String {
        imageUrl ?? ""
    }
}
