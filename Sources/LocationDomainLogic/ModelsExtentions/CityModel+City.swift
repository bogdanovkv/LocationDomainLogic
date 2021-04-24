//
//  CityModel+City.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import LocationRepositoryAbstraction
import LocationDomainAbstraction

extension CityModel {
	func cityValue() -> City {
		return .init(codeIATA: codeIATA,
					 countryCode: countryCode,
					 name: name,
					 nameRu: nameRu)
	}
}
