//
//  DetailViewController.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 20.01.2023.
//

import UIKit

protocol DetailViewControllerInterface: AnyObject {
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImage()
    func configureTitleLabel()
    func configureDemographicsLabel()
    func configureSynopsisLabel()
}

final class DetailViewController: UIViewController {

    var anime: AnimeData?
    private let viewModel = DetailViewModel()
    
    @IBOutlet weak var posterImageView: PosterImageView!
    @IBOutlet weak var demographicsLabel: UILabel!
    @IBOutlet weak var animeTitleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension DetailViewController: DetailViewControllerInterface {
    func configureVC() {
        view.backgroundColor = .white
        title = "Anime Detail"
    }
    
    func configurePosterImageView() {
        let posterWidth = CGFloat.deviceWidth * 0.4
        
        NSLayoutConstraint.activate([
                   posterImageView.widthAnchor.constraint(equalToConstant: posterWidth),
                   posterImageView.heightAnchor.constraint(equalToConstant: posterWidth * 1.4)
               ])
    }
    
    func downloadPosterImage() {
        guard let anime = anime else { return }
        posterImageView.downloadImage(image: anime._images._jpg._imageUrl)
    }
    
    func configureTitleLabel() {
        animeTitleLabel.text = anime?._titleEnglish
    }
    
    func configureDemographicsLabel() {
        guard let demographics = anime?.demographics else {
            demographicsLabel.text = "-"
            return
        }
        for demographic in demographics {
            demographicsLabel.text = demographic._name
        }
    }
    
    func configureSynopsisLabel() {
        synopsisLabel.text = anime?._synopsis
    }
}
