//
//  HomeViewModel.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 17.01.2023.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeViewControllerInterface? { get set }
    
    func viewDidLoad()
    func getAnimes()
}

final class HomeViewModel {
    weak var view: HomeViewControllerInterface?
    private let service = AnimeService()
    var animes: [AnimeData] = []
    var hasNextPage: Bool = true
    private var page = 1
}

extension HomeViewModel: HomeViewModelInterface {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getAnimes()
    }
    
    func getAnimes() {
        if hasNextPage {
            service.downloadAnimes(page: page) { [weak self] returnedAnimes in
                guard let self = self else { return }
                guard let returnedAnimes = returnedAnimes else { return }
                
                self.animes.append(contentsOf: returnedAnimes.animeData ?? [AnimeData]())
                if let pagination = returnedAnimes.pagination {
                    self.hasNextPage = pagination._hasNextPage
                }
                self.page += 1
                
                self.view?.reloadCollectionView()
            }
        }
    }
    
    func getDetail(id: Int) {
        service.downloadDetail(id: id) { [weak self] returnedAnimeDetail in
            guard let self = self else { return }
            guard let data = returnedAnimeDetail?.data else { return }

            self.view?.navigateToDetailViewController(anime: data)
        }
    }
    
    func getRandomAnimeDetail() {
        service.downloadRandomAnimeDetail() { [weak self] returnedRandomAnimeDetail in
            guard let self = self else { return }
            guard let data = returnedRandomAnimeDetail?.data else { return }
            
            self.view?.navigateToDetailViewController(anime: data)
        }
    }
}
