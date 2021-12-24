//
//  UIlable_Ext.swift
//  NewsApp
//
//  Created by eslam dweeb on 31/10/2021.
//

import UIKit
extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1,textColor:UIColor? = nil) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        guard let color = textColor else{return}
        self.textColor = color
    }
}
