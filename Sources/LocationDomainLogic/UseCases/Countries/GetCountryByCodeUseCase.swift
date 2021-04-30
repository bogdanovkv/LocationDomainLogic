//
//  File.swift
//  
//
//  Created by Константин Богданов on 30.04.2021.
//

import LocationRepositoryAbstraction
import LocationDomainAbstraction
import DomainAbstraction

/// Кейс получения страны по коду
final class GetCountryByCodeUseCase: UseCaseSync<String, Country?> {
	private let repository: CountriesRepositoryProtocol

	/// Инициализатор
	/// - Parameter repository: репозиторий
	init(repository: CountriesRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: String) -> Country? {
		return repository.getCountry(by: parameter)?.countryValue()
	}
}
