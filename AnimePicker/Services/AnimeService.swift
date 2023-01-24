//
//  AnimeService.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 20.01.2023.
//

import Foundation

final class AnimeService {
    
    func downloadAnimes(page: Int, completion: @escaping (Anime?) -> ()) {
        guard let url = URL(string: APIURLs.topAnimes(page: page)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func downloadDetail(id: Int, completion: @escaping (AnimeDataDetail?) -> ()) {
        guard let url = URL(string: APIURLs.selectedAnime(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func downloadRandomAnimeDetail(completion: @escaping (AnimeDataDetail?) -> ()) {
        guard let url = URL(string: APIURLs.randomAnime) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> Anime? {
        do {
            let anime = try JSONDecoder().decode(Anime.self, from: data)
            return anime
        } catch {
            handleWithError(error)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> AnimeDataDetail? {
        do {
            let animeDetail = try JSONDecoder().decode(AnimeDataDetail.self, from: data)
            return animeDetail
        } catch {
            handleWithError(error)
            return nil
        }
    }
}
