//
//  BTCNewViewController.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 8/25/24.
//

import UIKit

class BTCNewViewController: UIViewController, BTCViewModelOutput {
    
    let bitcoinImageView = {
        let imageView = UIImageView(image: UIImage(named: "bitcoin"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let usdLabel: UILabel = {
        let usdLabel = UILabel()
        usdLabel.text = "Loading..."
        usdLabel.font = .systemFont(ofSize: 85.0)
        usdLabel.textAlignment = .center
        usdLabel.adjustsFontSizeToFitWidth = true
        usdLabel.translatesAutoresizingMaskIntoConstraints = false
        return usdLabel
    }()
    
    let eurLabel: UILabel = {
        let eurLabel = UILabel()
        eurLabel.translatesAutoresizingMaskIntoConstraints = false
        eurLabel.text = ""
        eurLabel.font = UIFont.systemFont(ofSize: 33.0)
        eurLabel.textAlignment = .center
        return eurLabel
    }()
    
    
    let jpyLabel: UILabel = {
        let jpyLabel = UILabel()
        jpyLabel.translatesAutoresizingMaskIntoConstraints = false
        jpyLabel.text = ""
        jpyLabel.font = UIFont.systemFont(ofSize: 33.0)
        jpyLabel.textAlignment = .center
        return jpyLabel
    }()
    

    let viewModel: BTCViewModel
    
    init(viewModel: BTCViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        setupViews()
        viewModel.getPrice()
    }
    

    func updateView(usdPrice: Double, eurPrice: Double, jpyPrice: Double) {
        
        usdLabel.text = "$\(usdPrice)"
        eurLabel.text = "€\(eurPrice)"
        jpyLabel.text = "¥\(jpyPrice)"
    }
    
    func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(bitcoinImageView)
        view.addSubview(usdLabel)
        view.addSubview(eurLabel)
        view.addSubview(jpyLabel)
        
        NSLayoutConstraint.activate([
            bitcoinImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            bitcoinImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            bitcoinImageView.widthAnchor.constraint(equalToConstant: 300),
            bitcoinImageView.heightAnchor.constraint(equalToConstant: 300),
            
            usdLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            usdLabel.bottomAnchor.constraint(equalTo: bitcoinImageView.topAnchor, constant: 10),
            usdLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
            usdLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 1),
            
            eurLabel.topAnchor.constraint(equalTo: bitcoinImageView.bottomAnchor, constant: 24),
            eurLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
            eurLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 1),
            
            jpyLabel.topAnchor.constraint(equalTo: eurLabel.bottomAnchor, constant: 7.5),
            jpyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1),
            jpyLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 1),
        ])
    }
    
}
