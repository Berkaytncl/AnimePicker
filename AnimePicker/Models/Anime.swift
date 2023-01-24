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
        case pagination
        case animeData = "data"
    }
}

struct Pagination: Decodable {
    let hasNextPage: Bool?
    
    enum CodingKeys: String, CodingKey {
        case hasNextPage = "has_next_page"
    }
    
    var _hasNextPage: Bool {
        hasNextPage ?? false
    }
}

struct AnimeDataDetail: Decodable {
    let data: AnimeData?
}

struct AnimeData: Decodable {
    let id: Int?
    let images: Jpg?
    let title: String?
    let titleEnglish: String?
    let score: Float?
    let rank: Int?
    let synopsis: String?
    let demographics: [Demographic]?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case images, title
        case titleEnglish = "title_english"
        case score, rank, synopsis, demographics
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

struct Demographic: Decodable {
    let name: String?
    
    var _name: String {
        name ?? "-"
    }
}
