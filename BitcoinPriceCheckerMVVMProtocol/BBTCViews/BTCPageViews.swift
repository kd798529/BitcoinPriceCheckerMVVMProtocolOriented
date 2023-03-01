//
//  BTCPageViews.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 2/28/23.
//

import Foundation
import UIKit


struct BTCPageViews {
    
    let bitcoinImageView = {
        let imageView = UIImageView(image: UIImage(named: "bitcoin"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let layout = PageElementsAutoLayout()
        return imageView
    }()
    
    let usdLabel: UILabel = {
        let usdLabel = UILabel()
        usdLabel.text = "Loading..."
        usdLabel.font = .systemFont(ofSize: 85.0)
        usdLabel.textAlignment = .center
        usdLabel.adjustsFontSizeToFitWidth = true
        usdLabel.translatesAutoresizingMaskIntoConstraints = false
        let layout = PageElementsAutoLayout()
        return usdLabel
    }()
    
    let eurLabel: UILabel = {
        let eurLabel = UILabel()
        eurLabel.translatesAutoresizingMaskIntoConstraints = false
        eurLabel.text = ""
        eurLabel.font = UIFont.systemFont(ofSize: 33.0)
        eurLabel.textAlignment = .center
        let layout = PageElementsAutoLayout()
        return eurLabel
    }()
    
    
    let jpyLabel: UILabel = {
        let jpyLabel = UILabel()
        jpyLabel.translatesAutoresizingMaskIntoConstraints = false
        jpyLabel.text = ""
        jpyLabel.font = UIFont.systemFont(ofSize: 33.0)
        jpyLabel.textAlignment = .center
        let layout = PageElementsAutoLayout()
        return jpyLabel
    }()
    
}
