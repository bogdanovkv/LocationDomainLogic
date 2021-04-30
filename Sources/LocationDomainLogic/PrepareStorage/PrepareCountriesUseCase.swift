//
//  PrepareCountriesUseCase.swift
//  SBTSwiftProject
//
//  Created by Константин Богданов on 31.10.2020.
//  Copyright © 2020 Константин Богданов. All rights reserved.
//

import DomainAbstraction
import LocationRepositoryAbstraction
import LocationDomainAbstraction

final class PrepareCountriesUseCase: UseCase<Void, Void> {
	private let repository: CountriesRepositoryProtocol

	init(repository: CountriesRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: Void, _ completion: @escaping (Result<Void, Error>) -> Void) {
		repository.loadCountries { [weak self] result in
			guard let self = self else {
				return completion(.failure(LocationError.undefined))
			}
			if let countries = try? result.get() {
				self.repository.save(countries: countries) {
					completion(.success(()))
				}
				return
			}
			completion(.failure(LocationError.undefined))
		}
	}
}
