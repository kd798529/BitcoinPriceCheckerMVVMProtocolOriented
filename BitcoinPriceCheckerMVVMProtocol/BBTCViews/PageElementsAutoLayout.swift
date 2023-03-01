//
//  PageElementsAutoLayout.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 2/28/23.
//

import Foundation
import UIKit

enum AutoLayoutForItem {
    case bitcoinImage
    case usdLabel
    case eurLabel
    case jpyLabel
    case refreshBtn
}

struct PageElementsAutoLayout {
    func setUpAutoLayoutForPageElements(item: AutoLayoutForItem, label: UILabel, view: UIView, imgView: UIImageView, secondaryLabel: UILabel){
        switch item {
        case .bitcoinImage:
            NSLayoutConstraint.activate([
                imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                imgView.widthAnchor.constraint(equalToConstant: 300),
                imgView.heightAnchor.constraint(equalToConstant: 300),
            ])
            
        case .usdLabel:
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                label.bottomAnchor.constraint(equalTo: imgView.topAnchor, constant: 10),
                label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
                label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 1),
            ])
        case .eurLabel:
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 24),
                label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
                label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 1),
            ])
        case .jpyLabel:
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: secondaryLabel.topAnchor, constant: 7.5),
                label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
                label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 1),
            ])
        default:
            print("test")
        }
        
    }
    
}
