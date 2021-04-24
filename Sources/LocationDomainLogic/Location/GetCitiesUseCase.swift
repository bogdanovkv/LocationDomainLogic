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

final class GetCitiesUseCase: UseCaseSync<Country, [City]> {

	private let repository: LocationRepositoryProtocol

	init(repository: LocationRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: Country) -> [City] {
		return repository.getCities(for: .init(codeIATA: parameter.codeIATA,
											   name: parameter.name,
											   nameRu: parameter.nameRu)).map({ $0.cityValue() })
	}
}
