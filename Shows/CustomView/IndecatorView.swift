//
//  IndecatorView.swift
//  NewsApp
//
//  Created by eslam dweeb on 01/11/2021.
//

import UIKit

class IndecatorView:UIView{
    var animate:Bool = true{
        didSet {
            if animate{
                indicator.stopAnimating()
            }else{
                indicator.startAnimating()
            }
            isHidden = animate
        }
    }
    lazy var indicator:UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView()
        return indicator
    }()
    lazy var loadingLbl = UILabel(text: "Loading...", font: .boldSystemFont(ofSize: 13), numberOfLines: 0, textColor: .darkGray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        layer.cornerRadius = 8
        isHidden = animate
        loadingLbl.textAlignment = .center
        addSubview(indicator)
        addSubview(loadingLbl)
        indicator.centerInSuperview()
        loadingLbl.anchor(top: indicator.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 8, left: 8, bottom: 0, right: 8))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setShadow(shadowColor: UIColor.black.withAlphaComponent(0.5).cgColor, shadowOffset: .init(width: 0, height: 1), shadowOpacity: 0.3, shadowRaduis: 16)
    }
}
