//
//  RatingView.swift
//  ED_PizzaMaker
//
//  Created by eslam dweeb on 03/08/2021.
//

import UIKit

class RatingView:UIView{
    private var maxRating = 5
    var rating:Int = 5
    
    lazy var stackView:UIStackView = {
       let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
      //  configureWithRating(3)
    }
    func setupUI(){
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func configureWithRating(_ rating:Int,_ style:Style = .full){
        switch style {
        case .compact:
            let image = generateStarView(.filled)
            stackView.addArrangedSubview(image)
        default:
            if rating > 0 {
                for _ in 1...rating{
                    let image = generateStarView(.filled)
                    stackView.addArrangedSubview(image)
                }
                //Add Nonfilled stars
                let nonFilledCount = maxRating - rating
                if nonFilledCount > 0 {
                    for _ in 1...nonFilledCount{
                        let image = generateStarView(.nonFilled)
                        stackView.addArrangedSubview(image)
                    }
                }
            }
        }
    }
    private func generateStarView(_ type:StarType)-> UIImageView{
        let starImage:UIImage
        switch type {
        case .filled:
            starImage = #imageLiteral(resourceName: "fill1")
        case .nonFilled:
            starImage = #imageLiteral(resourceName: "starGrey")
        }
        let starImageView = UIImageView(image: starImage)
        starImageView.translatesAutoresizingMaskIntoConstraints =  false
      //  starImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        //starImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        starImageView.contentMode = .scaleAspectFit
        return starImageView
    }
    enum StarType {
        case nonFilled
        case filled
    }
    enum Style {
        case full
        case compact
    }
}
