//
//  File.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import DomainAbstraction
import LocationDomainAbstraction
import LocationRepositoryAbstraction

/// Кейс получения страны по имени
final class GetCountryByNameUseCase: UseCaseSync<String, Country?> {
	private let repository: CountriesRepositoryProtocol

	/// Инициализатор
	/// - Parameter repository: репозиторий
	init(repository: CountriesRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: String) -> Country? {
		return repository.getCountry(named: parameter)?.countryValue()
	}
}
