//
//  TagCollectionViewCell.swift
//  Dynamic CollectionView
//
//  Created by 박상우 on 2022/01/26.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    private let tagLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureLayout() {
        self.layer.cornerRadius = frame.height / 2
        self.backgroundColor = .lightGray
        self.addSubview(tagLabel)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            tagLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            tagLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            tagLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10)
        ])
    }
    
    private func configure(text: String) {
        self.tagLabel.text = text
    }
    
    // return adjusted cell Size
    static func adjustCellSize(height: CGFloat, label: String) -> CGSize {
        let cell = TagCollectionViewCell()
        cell.configure(text: label)
        
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: height)
        return cell.contentView.systemLayoutSizeFitting(targetSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel,
                                                        verticalFittingPriority: .required)
    }
}
