//
//  ViewController.swift
//  Dynamic CollectionView
//
//  Created by 박상우 on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let tags = ["사과", "바나나", "수박", "오렌지", "키위", "방울토마토"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.configureCollectionViewLayout()
    }
    
    private func configureCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: TagCollectionViewCell.identifier, bundle: nil),
                                     forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
    }
    
    private func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath
        ) as? TagCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(text: tags[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath
        ) as? TagCollectionViewCell else { return .zero }

        return cell.adjustCellSize(height: 45, label: tags[indexPath.item])
    }
}

