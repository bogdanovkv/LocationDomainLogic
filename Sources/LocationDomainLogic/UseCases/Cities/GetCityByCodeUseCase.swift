//
//  GetCityByCodeUseCase.swift
//  
//
//  Created by Константин Богданов on 29.04.2021.
//

import DomainAbstraction
import LocationRepositoryAbstraction
import LocationDomainAbstraction

/// Кейс получения города по коду
final class GetCityByCodeUseCase: UseCaseSync<String, City?> {

	private let repository: CitiesRepositoryProtocol

	/// Инициализатор
	/// - Parameter repository: репозиторий
	init(repository: CitiesRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: String) -> City? {
		return repository.getCity(by: parameter)?.cityValue()
	}
}
