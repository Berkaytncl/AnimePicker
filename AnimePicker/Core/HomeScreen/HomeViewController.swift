//
//  ViewController.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 17.01.2023.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
    func navigateToDetailViewController(anime: AnimeData)
}

final class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    @IBAction func pressedGetRandomAnime(_ sender: Any) {
        viewModel.getRandomAnimeDetail()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let anime = sender as? AnimeData {
                let destinationVC = segue.destination as? DetailViewController
                destinationVC?.anime = anime
            }
        }
    }
}

extension HomeViewController: HomeViewControllerInterface {
    
    func configureVC() {
        title = "Top Animes"
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemGray2
        
        let layout = UIHelper.createHomeFlowLayout()
        collectionView.collectionViewLayout = layout
    }
    
    func reloadCollectionView() {
        collectionView.reloadOnMainThread()
    }
    
    func navigateToDetailViewController(anime: AnimeData) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "toDetail", sender: anime)
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.animes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimeCell.reuseID, for: indexPath) as? AnimeCell
        guard let cell = cell else { return UICollectionViewCell() }
        
        cell.setCell(anime: viewModel.animes[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let anime = viewModel.animes[indexPath.item]
        collectionView.deselectItem(at: indexPath, animated: true)
        viewModel.getDetail(id: anime._id)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offSetY >= contentHeight - (2 * height) {
            viewModel.getAnimes()
        }
    }
}
