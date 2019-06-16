//
//  DetachmentDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

extension CreateDetachmentRequest: JSONConvertible {
    func toJSON() -> JSON {
        return ["name": name, "commandPoints": commandPoints, "armyId": armyId]
    }
}

extension AddDetachmentToRoasterRequest: JSONConvertible {
    func toJSON() -> JSON {
        return ["detachmentId": detachmentId]
    }
}

final class DetachmentDataManager: BaseDataManager {
    private let accountStore = AccountDataStore()

    func getDetachmentTypes(completion: @escaping ([DetachmentShortResponse]?, Error?) -> Void) {
        let request = HTTPRequest(method: .get,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/detachment-types",
                                  queryItems: nil,
                                  body: nil,
                                  headers: environmentManager.currentEnvironment.defaultHTTPHeaders)

        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let detachmentTypes: [DetachmentShortResponse] = try JSONDecoder().decodeResponseArray(from: data)
                completion(detachmentTypes, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func createDetachment(armyId: Int,
                          selectedDetachmentType: DetachmentShortResponse,
                          completion: @escaping (DetachmentResponse?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        let body = CreateDetachmentRequest(name: selectedDetachmentType.name,
                                           commandPoints: selectedDetachmentType.commandPoints,
                                           armyId: armyId).toJSON()
        let request = HTTPRequest(method: .post,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/detachments",
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

    func addDetachmentToRoaster(roasterId: Int, detachmentId: Int, completion: @escaping (RoasterResponse?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        let body = AddDetachmentToRoasterRequest(detachmentId: detachmentId).toJSON()
        let request = HTTPRequest(method: .post,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/roasters/\(roasterId)/detachments",
            queryItems: nil,
            body: body,
            headers: environmentManager.currentEnvironment.bearerAuthHeaders(token: token))

        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let roaster: RoasterResponse = try JSONDecoder().decodeResponse(from: data)
                completion(roaster, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
