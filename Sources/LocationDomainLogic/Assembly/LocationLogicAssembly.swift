//
//  File.swift
//  
//
//  Created by Константин Богданов on 24.04.2021.
//

import Foundation
import LocationRepositoryAbstraction
import UserSettingsRepositoryAbstraction
import DomainAbstraction
import LocationDomainAbstraction

public class LocationLogicAsembly {

	public func createPrepareStorageUseCase(locationRepository: LocationRepositoryProtocol,
											settingsRepository: UserSettingsRepositoryProtocol) -> UseCase<Void, Void> {
		let prepareCitiesUseCase = PrepareCitiesUseCase(locationRepository: locationRepository)
		let prepareAirportsUseCase = PrepareAirportsUseCase(locationRepository: locationRepository)
		let prepareCountriesUseCase = PrepareCountriesUseCase(locationRepository: locationRepository)
		return PrepareStorageUseCase(settingsRepository: settingsRepository,
									 locationRepository: locationRepository,
									 prepareAirportsUseCase: prepareAirportsUseCase,
									 prepareCountriesUseCase: prepareCountriesUseCase,
									 prepareCitiesUseCase: prepareCitiesUseCase)
	}

	public func createGetCitySyncUseCase(locationRepository: LocationRepositoryProtocol) -> UseCaseSync<String, City?> {
		return GetCityUseCase(repository: locationRepository)
	}

	public func createGetCountrySyncUseCase(locationRepository: LocationRepositoryProtocol) -> UseCaseSync<String, Country?> {
		return GetCountryUseCase(repository: locationRepository)
	}

	public func createGetCitiesUseCase(locationRepository: LocationRepositoryProtocol) -> UseCaseSync<Country, [City]> {
		return GetCitiesUseCase(repository: locationRepository)
	}

	public func createGetCcountriesUseCase(locationRepository: LocationRepositoryProtocol) -> UseCaseSync<Void, [Country]> {
		return GetCountriesUseCase(repository: locationRepository)
	}
}
