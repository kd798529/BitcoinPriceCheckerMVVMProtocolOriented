//
//  ViewController.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 2/28/23.
//

import UIKit

class BTCViewController: UIViewController, BTCViewModelOutput {
    
    
    
    private let viewModel: BTCViewModel
    
    init(viewModel: BTCViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .white
        let pageModel = PageElementsModel()
        pageModel.loadViewModels(view: self.view)
        let bitcoinLogo = PageElementsAutoLayout()
        bitcoinLogo.setUpAutoLayoutForPageElements(item: .bitcoinImage, label: pageModel.viewModels[2] as! UILabel, view: view, imgView: pageModel.viewModels[0] as! UIImageView, secondaryLabel: pageModel.viewModels[2] as! UILabel)
        let usdLabel = PageElementsAutoLayout()
        usdLabel.setUpAutoLayoutForPageElements(item: .usdLabel, label: pageModel.viewModels[1] as! UILabel, view: view, imgView: pageModel.viewModels[0] as! UIImageView, secondaryLabel: pageModel.viewModels[2] as! UILabel)
        let eurLabel = PageElementsAutoLayout()
        eurLabel.setUpAutoLayoutForPageElements(item: .eurLabel, label: pageModel.viewModels[2] as! UILabel, view: view, imgView: pageModel.viewModels[0] as! UIImageView, secondaryLabel: pageModel.viewModels[2] as! UILabel)
        let jpyLabel = PageElementsAutoLayout()
        jpyLabel.setUpAutoLayoutForPageElements(item: .eurLabel, label: pageModel.viewModels[3] as! UILabel, view: view, imgView: pageModel.viewModels[0] as! UIImageView, secondaryLabel: pageModel.viewModels[2] as! UILabel)
        
        viewModel.getPrice()
        
    }
    
    
    
    //I know this is Bad Code Im having trouble on how to update the labels properly without creating a new view
    
    
    func updateView(usdPrice: Double, eurPrice: Double, jpyPrice: Double) {
        let pageModel = PageElementsModel()
        let usd =  pageModel.viewModels[1] as! UILabel
        let eur = pageModel.viewModels[2] as! UILabel
        let jpy = pageModel.viewModels[3] as! UILabel
        
        usd.text = String(usdPrice)
        eur.text = String(eurPrice)
        jpy.text = String(jpyPrice)
        pageModel.loadViewModels(view: self.view)
        let bitcoinLogo = PageElementsAutoLayout()
        bitcoinLogo.setUpAutoLayoutForPageElements(item: .bitcoinImage, label: pageModel.viewModels[2] as! UILabel, view: view, imgView: pageModel.viewModels[0] as! UIImageView, secondaryLabel: pageModel.viewModels[2] as! UILabel)
        let usdLabel = PageElementsAutoLayout()
        usdLabel.setUpAutoLayoutForPageElements(item: .usdLabel, label: pageModel.viewModels[1] as! UILabel, view: view, imgView: pageModel.viewModels[0] as! UIImageView, secondaryLabel: pageModel.viewModels[2] as! UILabel)
        let eurLabel = PageElementsAutoLayout()
        eurLabel.setUpAutoLayoutForPageElements(item: .eurLabel, label: pageModel.viewModels[2] as! UILabel, view: view, imgView: pageModel.viewModels[0] as! UIImageView, secondaryLabel: pageModel.viewModels[2] as! UILabel)
        let jpyLabel = PageElementsAutoLayout()
        jpyLabel.setUpAutoLayoutForPageElements(item: .eurLabel, label: pageModel.viewModels[3] as! UILabel, view: view, imgView: pageModel.viewModels[0] as! UIImageView, secondaryLabel: pageModel.viewModels[2] as! UILabel)
        
        
        
    }
    
    
}

