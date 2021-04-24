//
//  GetCityUseCase.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import DomainAbstraction
import LocationRepositoryAbstraction
import LocationDomainAbstraction

final class GetCityUseCase: UseCaseSync<String, City?> {

	private let repository: LocationRepositoryProtocol

	init(repository: LocationRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: String) -> City? {
		return repository.getCity(with: parameter)?.cityValue()
	}
}
