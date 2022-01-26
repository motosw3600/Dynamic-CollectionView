//
//  TagCollectionViewCell.swift
//  Dynamic CollectionView
//
//  Created by 박상우 on 2022/01/26.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TagCollectionViewCell"
    @IBOutlet weak var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureView()
    }
    
    private func configureView() {
        self.backgroundColor = .lightGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = frame.height / 2
    }
    
    func configure(text: String) {
        self.tagLabel.text = text
    }
    
    // return adjusted cell Size
    func adjustCellSize(height: CGFloat, label: String) -> CGSize {
        self.tagLabel.text = label
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: height)
        return self.contentView.systemLayoutSizeFitting(targetSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel,
                                                        verticalFittingPriority: .required)
    }

}
