//
//  Country.swift
//  CountriesFlagsAndCodes
//
//  Created by Niraj on 2020-08-23.
//  Copyright © 2020 Technomystic. All rights reserved.
//

import Foundation

    struct Country: Identifiable,Codable {
        var id: UUID? = UUID()
        let name: String
        let code: String
        let flag: String
        let appStore: Bool
    }

