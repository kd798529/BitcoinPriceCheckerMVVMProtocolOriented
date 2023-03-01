//
//  PageElementsModel.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 2/28/23.
//

import Foundation
import UIKit

class PageElementsModel {
    var viewModels = [UIView]()
    
    init() {
        let modelView = BTCPageViews()
        viewModels.append(modelView.bitcoinImageView)
        viewModels.append(modelView.usdLabel)
        viewModels.append(modelView.eurLabel)
        viewModels.append(modelView.jpyLabel)
    }
    
    public func loadViewModels(view: UIView) {
        for v in viewModels {
            view.addSubview(v)
        }
        print("\(viewModels.count) elements have been placed on the view")
    }
}
