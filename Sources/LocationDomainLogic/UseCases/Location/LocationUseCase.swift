//
//  LocationUseCase.swift
//  SBTSwiftProject
//
//  Created by Константин Богданов on 24.10.2020.
//  Copyright © 2020 Константин Богданов. All rights reserved.
//

import LocationRepositoryAbstraction
import LocationDomainAbstraction
import DomainAbstraction

/// Кейс получения местополжения
final class LocationUseCase: UseCase<Void, Location> {
	private let repository: LocationRepositoryProtocol

	/// Инициализатор
	/// - Parameter repository: реозиторий
	init(repository: LocationRepositoryProtocol) {
		self.repository = repository
	}

	override func execute(parameter: Void, _ completion: @escaping (Result<Location, Error>) -> Void) {
		repository.loadLocation { result in
			do {
				let locationModel = try result.get()
				completion(.success(locationModel.locationValue()))
			} catch {
				completion(.failure(error))
			}
		}
	}
}
