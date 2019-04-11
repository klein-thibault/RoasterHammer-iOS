//
//  UnitDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

extension AddUnitToDetachmentRequest: JSONConvertible {
    func toJSON() -> JSON {
        return ["unitQuantity": unitQuantity]
    }
}

extension UnitFilters: QueryItemConvertible {
    func toQueryItems() -> QueryItems? {
        guard let armyId = armyId, let unitType = unitType else {
            return nil
        }

        return ["armyId": armyId, "unitType": unitType]
    }
}

final class UnitDataManager: BaseDataManager {
    private let accountStore = AccountDataStore()

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

    func addUnitToDetachment(detachmentId: Int,
                             unitRoleId: Int,
                             unitId: Int,
                             quantity: Int,
                             completion: @escaping (DetachmentResponse?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        let body = AddUnitToDetachmentRequest(unitQuantity: quantity).toJSON()

        let request = HTTPRequest(method: .post,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/detachments/\(detachmentId)/roles/\(unitRoleId)/units/\(unitId)",
            queryItems: nil,
            body: body,
            headers: environmentManager.currentEnvironment.bearerAuthHeaders(token: token))

        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let detachment: DetachmentResponse = try JSONDecoder().decodeResponse(from: data)
                completion(detachment, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func removeUnitFromDetachment(detachmentId: Int,
                                  unitRoleId: Int,
                                  unitId: Int,
                                  completion: @escaping (DetachmentResponse?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        let request = HTTPRequest(method: .delete,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/detachments/\(detachmentId)/roles/\(unitRoleId)/units/\(unitId)",
            queryItems: nil,
            body: nil,
            headers: environmentManager.currentEnvironment.bearerAuthHeaders(token: token))

        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let detachment: DetachmentResponse = try JSONDecoder().decodeResponse(from: data)
                completion(detachment, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
