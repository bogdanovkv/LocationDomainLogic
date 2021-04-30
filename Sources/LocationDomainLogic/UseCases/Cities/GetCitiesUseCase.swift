//
//  GetCitiesUseCase.swift
//  SBTSwiftProject
//
//  Created by Константин Богданов on 03.11.2020.
//  Copyright © 2020 Константин Богданов. All rights reserved.
//

import LocationRepositoryAbstraction
import DomainAbstraction
import LocationDomainAbstraction

/// Получает города по коду страны
final class GetCitiesByCountryCodeSyncUseCase: UseCaseSync<String, [City]> {

	private let repository: CitiesRepositoryProtocol

	/// Инициализатор
	/// - Parameter repository: репозиторий
	init(repository: CitiesRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: String) -> [City] {
		return repository.getCities(for: parameter).map({ $0.cityValue() })
	}
}
