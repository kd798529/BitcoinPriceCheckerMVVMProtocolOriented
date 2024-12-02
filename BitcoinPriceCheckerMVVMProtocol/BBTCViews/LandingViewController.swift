//
//  LandingViewController.swift
//  BitcoinPriceCheckerMVVMProtocol
//
//  Created by Kwaku Dapaah on 9/1/24.
//

import UIKit

class LandingViewController: UIViewController, LandingViewModelOutput {
    
    
    
    var availableCurrencies: [CryptoCurrency] = [CryptoCurrency(symbol: "BTC", imageName: "bitcoin", crypto: Currency(USD: 0.00, EUR: 0.00, JPY: 0.00)), CryptoCurrency(symbol: "LTC", imageName: "litecoin", crypto: Currency(USD: 0.00, EUR: 0.00, JPY: 0.00)), CryptoCurrency(symbol: "XMR", imageName: "monero", crypto: Currency(USD: 0.00, EUR: 0.00, JPY: 0.00)),]
    
    let tableView: UITableView = {
        var tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.allowsSelection = true
        tv.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        //handles page refreshing of new prices
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefreshcontrol), for: .valueChanged)
        tv.refreshControl = refreshControl
        
        return tv
    }()
    
    let viewModel: LandingViewModel
    
    init(viewModel: LandingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupViews()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        fetchData()
                
    }
    
    
  
    func fetchData() {
        viewModel.getCryptoList()
        self.tableView.reloadData()
    }
    
    func updateView(BTC: Currency, LTC: Currency, XMR: Currency) {
        self.availableCurrencies[0].crypto = BTC
        self.availableCurrencies[1].crypto = LTC
        self.availableCurrencies[2].crypto = XMR
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        cell.currencyPriceLabel.text = "$\(availableCurrencies[indexPath.row].crypto.USD)"
        print("this is the cash " + cell.currencyPriceLabel.text!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell tapped")
        viewModel.getCryptoList()
        print(availableCurrencies)
        self.tableView.reloadData()
    }

    
    @objc func handleRefreshcontrol() {
        //Update get prices then reload the table with new prices
        viewModel.getCryptoList()
        print(availableCurrencies)
        self.tableView.reloadData()
        
        //Dismiss the refresh control
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}
