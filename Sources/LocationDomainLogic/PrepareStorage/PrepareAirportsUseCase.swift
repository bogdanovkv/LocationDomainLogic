//
//  PrepareAirportsUseCase.swift
//  SBTSwiftProject
//
//  Created by Константин Богданов on 31.10.2020.
//  Copyright © 2020 Константин Богданов. All rights reserved.
//

import LocationRepositoryAbstraction
import LocationDomainAbstraction
import DomainAbstraction

final class PrepareAirportsUseCase: UseCase<Void, Void> {

	private let repository: AirportsRepositoryProtocol

	init(repository: AirportsRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: Void, _ completion: @escaping (Result<Void, Error>) -> Void) {
		repository.loadAirports { [weak self] result in
			guard let self = self else {
				return completion(.failure(LocationError.undefined))
			}
			if let airports = try? result.get() {
				self.repository.save(airports: airports) {
					completion(.success(()))
				}
				return
			}
			completion(.failure(LocationError.undefined))
		}
	}
}
