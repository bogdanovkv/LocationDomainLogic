//
//  PrepareCitiesUseCase.swift
//  SBTSwiftProject
//
//  Created by Константин Богданов on 31.10.2020.
//  Copyright © 2020 Константин Богданов. All rights reserved.
//

import DomainAbstraction
import LocationRepositoryAbstraction
import LocationDomainAbstraction

final class PrepareCitiesUseCase: UseCase<Void, Void> {

	private let repository: CitiesRepositoryProtocol

	init(repository: CitiesRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: Void, _ completion: @escaping (Result<Void, Error>) -> Void) {
		repository.loadCities { [weak self] result in
			guard let self = self else {
				return completion(.failure(LocationError.undefined))
			}
			if let cities = try? result.get() {
				self.repository.save(cities: cities) {
					completion(.success(()))
				}
				return
			}
			completion(.failure(LocationError.undefined))
		}
	}
}
