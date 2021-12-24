//
//  VerticalStack.swift
//  NewsApp
//
//  Created by eslam dweeb on 31/10/2021.
//

import UIKit


class VerticalStack:UIStackView{
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
