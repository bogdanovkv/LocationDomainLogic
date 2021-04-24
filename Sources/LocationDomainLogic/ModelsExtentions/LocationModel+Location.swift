//
//  File.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import LocationRepositoryAbstraction
import LocationDomainAbstraction

extension LocationModel {
	func locationValue() -> Location {
		return .init(country: country, city: city)
	}
}
