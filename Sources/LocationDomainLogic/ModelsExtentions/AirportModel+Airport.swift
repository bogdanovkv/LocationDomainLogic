//
//  AirportModel+Airport.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import LocationRepositoryAbstraction
import LocationDomainAbstraction

extension AirportModel {
	func airportValue() -> Airport {
		return .init(code: code,
					 name: name,
					 countryCode: countryCode,
					 cityCode: cityCode)
	}
}
