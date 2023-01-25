//
//  CollectionViewCell.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 20.01.2023.
//

import UIKit

class AnimeCell: UICollectionViewCell {
    
    static let reuseID = "AnimeCell"
    
    @IBOutlet weak private var posterImageView: PosterImageView!
    @IBOutlet weak private var animeLabel: UILabel!
    @IBOutlet weak private var ratingBadgeView: UIView!
    @IBOutlet weak private var ratingBadgeLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
            
        posterImageView.image = nil
        posterImageView.cancelDownloading()
    }
        
    func setCell(anime: AnimeData) {
        configureCell()
        
        posterImageView.downloadImage(image: anime._images._jpg._imageUrl)
        animeLabel.text = anime._titleEnglish
        
        ratingBadgeView.layer.borderWidth = 2
        ratingBadgeView.layer.borderColor = UIColor.white.cgColor
        ratingBadgeLabel.text = anime._score.description
    }
    
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
    }
}
