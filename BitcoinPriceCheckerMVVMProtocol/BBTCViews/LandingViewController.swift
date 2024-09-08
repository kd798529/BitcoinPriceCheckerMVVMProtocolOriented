//
//  LandingViewController.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 9/1/24.
//

import UIKit

class LandingViewController: UIViewController {
    
    let availableCurrencies: [Crypto] = [Crypto(symbol: "BTC", imageName: "bitcoin"), Crypto(symbol: "LTC", imageName: "litecoin"), Crypto(symbol: "XMR", imageName: "monero")]
    
    let tableView: UITableView = {
        var tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.allowsSelection = true
        tv.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    

    func setupViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("CustomCell class not found")
        }
        cell.logoImageView.image = UIImage(named: availableCurrencies[indexPath.row].imageName)
        cell.currencyNameLabel.text = availableCurrencies[indexPath.row].imageName
        cell.currencySymbolLabel.text = availableCurrencies[indexPath.row].symbol
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell tapped")
    }
    
    
}
