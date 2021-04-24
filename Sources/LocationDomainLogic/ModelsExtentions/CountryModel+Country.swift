//
//  CountryModel+Country.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import LocationRepositoryAbstraction
import LocationDomainAbstraction

extension CountryModel {
	func countryValue() -> Country {
		return .init(codeIATA: codeIATA,
					 name: name,
					 nameRu: nameRu)
	}
}
