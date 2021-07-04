//
//  Country.swift
//  JNetworkLayer
//
//  Created by Josue German Hernandez Gonzalez on 04-07-21.
//

import UIKit

struct AllCountries: Codable {
    let allCountries: [Country]
}


struct Country: Codable {
    let country: String
}
