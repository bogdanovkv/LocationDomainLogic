//
//  GetCountriesUseCase.swift
//  SBTSwiftProject
//
//  Created by Константин Богданов on 02.11.2020.
//  Copyright © 2020 Константин Богданов. All rights reserved.
//

import LocationRepositoryAbstraction
import LocationDomainAbstraction
import DomainAbstraction

final class GetCountriesUseCase: UseCaseSync<Void, [Country]> {
	private let repository: LocationRepositoryProtocol

	init(repository: LocationRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: Void) -> [Country] {
		return repository.getCountries().map({ $0.countryValue() })
	}
}
