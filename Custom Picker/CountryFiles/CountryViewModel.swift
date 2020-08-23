//
//  CountryDataSource.swift
//  CountriesFlagsAndCodes
//
//  Created by Niraj on 2020-08-23.
//  Copyright © 2020 Technomystic. All rights reserved.
//

import Foundation

class CountryViewModel: NSObject, ObservableObject {
    @Published var countries = [Country]()

    var countryNamesArray:[String] {
        countries.map{"\($0.flag) \($0.name)"}.sorted()
    }
    
    
    override init() {
        countries = Store.retrieveCountries()
    }
}
