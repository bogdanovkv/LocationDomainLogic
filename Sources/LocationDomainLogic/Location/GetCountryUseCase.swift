//
//  File.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import DomainAbstraction
import LocationDomainAbstraction
import LocationRepositoryAbstraction

final class GetCountryUseCase: UseCaseSync<String, Country?> {
	private let repository: LocationRepositoryProtocol

	init(repository: LocationRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: String) -> Country? {
		return repository.getCountry(with: parameter)?.countryValue()
	}
}
