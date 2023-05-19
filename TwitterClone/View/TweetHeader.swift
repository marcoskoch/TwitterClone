//
//  TweetHeader.swift
//  TwitterClone
//
//  Created by Marcos Michel on 19/05/23.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemOrange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
