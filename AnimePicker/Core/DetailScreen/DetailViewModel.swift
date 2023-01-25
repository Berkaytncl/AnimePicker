//
//  DetailViewModel.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 20.01.2023.
//

import Foundation

protocol DetailViewModelInterface {
    var view: DetailViewControllerInterface? { get set }
    
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailViewControllerInterface?
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDemographicsLabel()
        view?.configureSynopsisLabel()
    }
    
}
