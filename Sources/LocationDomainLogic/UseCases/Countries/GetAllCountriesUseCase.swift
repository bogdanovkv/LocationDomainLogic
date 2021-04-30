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

/// Кейс получения списка всех стран
final class GetAllCountriesUseCase: UseCaseSync<Void, [Country]> {
	private let repository: CountriesRepositoryProtocol

	/// Инициализатор
	/// - Parameter repository: репозиторий
	init(repository: CountriesRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: Void) -> [Country] {
		return repository.getCountries().map({ $0.countryValue() })
	}
}
