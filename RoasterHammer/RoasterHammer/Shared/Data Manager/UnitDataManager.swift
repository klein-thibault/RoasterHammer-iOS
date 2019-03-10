//
//  UnitDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

extension UnitFilters: QueryItemConvertible {
    func toQueryItems() -> QueryItems? {
        guard let armyId = armyId, let unitType = unitType else {
            return nil
        }

        return ["armyId": armyId, "unitType": unitType]
    }
}

final class UnitDataManager: BaseDataManager {
    func getUnits(withFilters filters: UnitFilters?,
                  completion: @escaping ([UnitResponse]?, Error?) -> Void) {
        let request = HTTPRequest(method: .get,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/units",
                                  queryItems: filters?.toQueryItems(),
                                  body: nil,
                                  headers: environmentManager.currentEnvironment.defaultHTTPHeaders)

        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let units: [UnitResponse] = try JSONDecoder().decodeResponseArray(from: data)
                completion(units, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
