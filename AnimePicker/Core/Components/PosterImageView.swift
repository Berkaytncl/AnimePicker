//
//  PosterImageView.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 20.01.2023.
//

import UIKit

final class PosterImageView: UIImageView {

    private var dataTask: URLSessionDataTask?
    
    func downloadImage(image: String) {
        guard let url = URL(string: "\(image)") else { return }
        
        dataTask = NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async { self.image = UIImage(data: data) }
            case .failure(_):
                break
            }
        }
    }
    
    func cancelDownloading() {
        self.dataTask?.cancel()
        self.dataTask = nil
    }
}
