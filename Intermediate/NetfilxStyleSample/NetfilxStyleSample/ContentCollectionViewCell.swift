//
//  ContentCollectionViewCell.swift
//  NetflixStyleSampleApp
//
//  Created by 이준복 on 2022/03/24.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {
    let
        imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleToFill
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
