//
//  ShowCell.swift
//  Shows
//
//  Created by eslam dweeb on 26/12/2021.
//

import UIKit


class ShowCell:UITableViewCell{
    //MARK:- UI Components
    lazy var cardView = CardView()
    lazy var showImage:UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    lazy var showNameLabel:UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.text = "Name:"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    lazy var showRuntimeLabel:UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.text = "Runtime:"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    lazy var showNameLabelValue:UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    lazy var showRuntimeLabelValue:UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    lazy var premieredLabel:UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.text = "Premiered:"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    lazy var linkLabel:UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.text = "Link:"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    lazy var premieredValue:UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    lazy var linkLabelValue:UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    lazy var rateLabel:UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.text = "Rate:"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    lazy var rateLabelValue:UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    lazy var rateView:RatingView = {
       let v = RatingView()
        v.configureWithRating(1, .compact)
        return v
    }()
    lazy var rateStackView = UIStackView(arrangedSubviews: [
        rateLabel,
        UIStackView(arrangedSubviews: [rateView,rateLabelValue], customSpacing: 5)
    
    ], customSpacing: 8)
    lazy var detailsVStack = VerticalStack(arrangedSubviews: [
        UIStackView(arrangedSubviews: [showNameLabel,showNameLabelValue], customSpacing: 8),
        rateStackView,
        UIStackView(arrangedSubviews: [showRuntimeLabel,showRuntimeLabelValue], customSpacing: 8),
        UIStackView(arrangedSubviews: [showRuntimeLabel,showRuntimeLabelValue], customSpacing: 8),
        UIStackView(arrangedSubviews: [premieredLabel,premieredValue], customSpacing: 8),
        UIStackView(arrangedSubviews: [linkLabel,linkLabelValue], customSpacing: 8)
        
    ], spacing: 8)
    lazy var stackView = UIStackView(arrangedSubviews: [
        showImage,detailsVStack
    ], customSpacing: 8)
    
    //MARK:- Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        showNameLabel.text = ""
        showImage.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Setup Functions
    private func setupCell(){
        selectionStyle = .none
        addSubviews()
        addConstraints()
    }
    private func addSubviews(){
        addSubview(cardView)
        cardView.addSubview(stackView)
    }
    private func addConstraints(){
        cardView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        showImage.constrainWidth(constant: 100)
        showImage.constrainHeight(constant: 100)
        stackView.centerYInSuperview()
        stackView.anchor(top: nil, leading: cardView.leadingAnchor, bottom: nil, trailing: cardView.trailingAnchor,padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
}
