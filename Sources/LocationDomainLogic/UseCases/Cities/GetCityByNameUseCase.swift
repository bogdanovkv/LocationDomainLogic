//
//  GetCityUseCase.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import DomainAbstraction
import LocationRepositoryAbstraction
import LocationDomainAbstraction

/// Получает город по имени
final class GetCityByNameUseCase: UseCaseSync<String, City?> {
	private let repository: CitiesRepositoryProtocol

	/// Инициализатор
	/// - Parameter repository: репозиторий
	init(repository: CitiesRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: String) -> City? {
		return repository.getCity(named: parameter)?.cityValue()
	}
}
