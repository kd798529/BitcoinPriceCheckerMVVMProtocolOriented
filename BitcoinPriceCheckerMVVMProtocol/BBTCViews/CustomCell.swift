//
//  CustomCell.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 9/1/24.
//

import UIKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "bitcoin")
        return iv
    }()
    
    let currencyNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "loading"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currencySymbolLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "loading"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let currencyPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "$0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(currencyNameLabel)
        contentView.addSubview(currencySymbolLabel)
        contentView.addSubview(currencyPriceLabel)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 5),
            logoImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 25),
            logoImageView.widthAnchor.constraint(equalToConstant: 25),
            
            currencyNameLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            currencyNameLabel.leadingAnchor.constraint(equalTo: self.logoImageView.trailingAnchor, constant: 10),
            
            currencySymbolLabel.topAnchor.constraint(equalTo: self.currencyNameLabel.bottomAnchor),
            currencySymbolLabel.leadingAnchor.constraint(equalTo: self.logoImageView.trailingAnchor, constant: 10),
            
            currencyPriceLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            currencyPriceLabel.leadingAnchor.constraint(equalTo: self.currencyNameLabel.trailingAnchor, constant: -50),
            currencyPriceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        
        ])
    }
}
