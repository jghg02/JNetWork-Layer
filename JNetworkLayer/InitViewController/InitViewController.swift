//
//  InitViewController.swift
//  JNetworkLayer
//
//  Created by Josue German Hernandez Gonzalez on 03-07-21.
//

import UIKit

class InitViewController: UIViewController {

    private var fetchData: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Init ViewController"
        fetchAllCountries()
    }
    
    func fetchAllCountries() {
        let queryMode = CovidAPIQueryParams()
        fetchData = CovidServicesRequest().getAllCountries(apiQueryModel: queryMode) { [weak self] result in
            self?.fetchData = nil
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    print("ALLLLLL \(result.count)")
                case .failure(let error):
                    print("ERROR \(error)")
                }
            }
        }
    }
}
