//
//  PrepareStorageUseCase.swift
//  SBTSwiftProject
//
//  Created by Константин Богданов on 24.10.2020.
//  Copyright © 2020 Константин Богданов. All rights reserved.
//

import DomainAbstraction
import LocationRepositoryAbstraction
import UserSettingsRepositoryAbstraction
import LocationDomainAbstraction
import Foundation

final class PrepareStorageUseCase: UseCase<Void, Void> {

	// TODO: - make public
	enum CaseError: Error {
		case locationError
	}

	private var settingsRepository: UserSettingsRepositoryProtocol
	private let prepareAirportsUseCase: UseCase<Void, Void>
	private let prepareCountriesUseCase: UseCase<Void, Void>
	private let prepareCitiesUseCase: UseCase<Void, Void>
	private let clearStorageUseCase: UseCaseSync<Void, Void>
	private var citiesLoaded: Bool
	private var countriesLoaded: Bool
	private var airportsLoad: Bool

	init(settingsRepository: UserSettingsRepositoryProtocol,
		 prepareAirportsUseCase: UseCase<Void, Void>,
		 prepareCountriesUseCase: UseCase<Void, Void>,
		 prepareCitiesUseCase: UseCase<Void, Void>,
		 clearStorageUseCase: UseCaseSync<Void, Void>) {
		self.settingsRepository = settingsRepository
		self.clearStorageUseCase = clearStorageUseCase
		self.prepareCitiesUseCase = prepareCitiesUseCase
		self.prepareCountriesUseCase = prepareCountriesUseCase
		self.prepareAirportsUseCase = prepareAirportsUseCase
		citiesLoaded = false
		countriesLoaded = false
		airportsLoad = false
	}

	override func execute(parameter: Void, _ completion: @escaping (Result<Void, Error>) -> Void) {
		guard !settingsRepository.didIntializeStorage else {
			return completion(.success(()))
		}
		clearStorageUseCase.execute(parameter: ())
		let group = DispatchGroup()

		group.enter()
		group.enter()
		group.enter()

		prepareCitiesUseCase.execute(parameter: ()) { [weak self] result in
			if let _ = try? result.get() {
				self?.citiesLoaded = true
			}
			group.leave()
		}
		prepareAirportsUseCase.execute(parameter: ()) { [weak self] result in
			if let _ = try? result.get() {
				self?.airportsLoad = true
			}
			group.leave()
		}
		prepareCountriesUseCase.execute(parameter: ()) { [weak self] result in
			if let _ = try? result.get() {
				self?.countriesLoaded = true
			}
			group.leave()
		}

		group.notify(queue: .main, work: .init(block: { [weak self] in
			guard let self = self else {
				return completion(.failure(LocationError.undefined))
			}
			if [self.airportsLoad, self.citiesLoaded, self.countriesLoaded].allSatisfy({ $0 }) {
				self.settingsRepository.didIntializeStorage = true
				return completion(.success(()))
			}
			self.clearStorageUseCase.execute(parameter: ())
			completion(.failure(LocationError.undefined))
		}))
	}
}
