//
//  UIStackView_Ext.swift
//  NewsApp
//
//  Created by eslam dweeb on 31/10/2021.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
