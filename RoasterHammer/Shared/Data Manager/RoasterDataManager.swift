//
//  RoasterDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

extension CreateRoasterRequest: JSONConvertible {
    func toJSON() -> JSON {
        return ["name": name]
    }
}

final class RoasterDataManager: BaseDataManager {
    private let accountStore = AccountDataStore()
    private let gameStore = GameDataStore()
    private let gameDataManager: GameDataManager

    override init(environmentManager: HTTPEnvironmentManager,
                  httpClient: HTTPClient = AlamofireHTTPClient()) {
        gameDataManager = GameDataManager(environmentManager: environmentManager, httpClient: httpClient)
        super.init(environmentManager: environmentManager, httpClient: httpClient)
    }

    // MARK: - Public Functions

    func createRoaster(name: String, completion: @escaping (RoasterResponse?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        let body = CreateRoasterRequest(name: name).toJSON()

        if let gameId = gameStore.getGameId() {
            createRoasters(token: token, gameId: gameId, body: body, completion: completion)
        } else {
            let gameDataManager = GameDataManager(environmentManager: environmentManager)
            gameDataManager.getUserGames { [weak self] (games, error) in
                if let error = error {
                    completion(nil, error)
                }

                if let gameId = self?.gameStore.getGameId() {
                    self?.createRoasters(token: token, gameId: gameId, body: body, completion: completion)
                }
            }
        }
    }

    func getRoasters(completion: @escaping ([RoasterResponse]?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        if let gameId = gameStore.getGameId() {
            getRoasters(token: token, gameId: gameId, completion: completion)
        } else {
            gameDataManager.getUserGames { [weak self] (games, error) in
                if let error = error {
                    completion(nil, error)
                }

                if let gameId = self?.gameStore.getGameId() {
                    self?.getRoasters(token: token, gameId: gameId, completion: completion)
                }
            }
        }
    }

    func getRoaster(byRoasterId roasterId: Int, completion: @escaping (RoasterResponse?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        if let gameId = gameStore.getGameId() {
            getRoaster(byRoasterId: roasterId,
                       token: token,
                       gameId: gameId,
                       completion: completion)
        } else {
            gameDataManager.getUserGames { [weak self] (games, error) in
                if let error = error {
                    completion(nil, error)
                }

                if let gameId = self?.gameStore.getGameId() {
                    self?.getRoaster(byRoasterId: roasterId,
                                     token: token,
                                     gameId: gameId,
                                     completion: completion)
                }
            }
        }
    }

    // MARK: - Private Functions

    private func createRoasters(token: String, gameId: Int, body: JSON, completion: @escaping (RoasterResponse?, Error?) -> Void) {
        let request = HTTPRequest(method: .post,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/games/\(gameId)/roasters",
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

    private func getRoasters(token: String, gameId: Int, completion: @escaping ([RoasterResponse]?, Error?) -> Void) {
        let request = HTTPRequest(method: .get,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/games/\(gameId)/roasters",
            queryItems: nil,
            body: nil,
            headers: environmentManager.currentEnvironment.bearerAuthHeaders(token: token))

        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let roasters: [RoasterResponse] = try JSONDecoder().decodeResponseArray(from: data)
                completion(roasters, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    private func getRoaster(byRoasterId roasterId: Int,
                            token: String,
                            gameId: Int,
                            completion: @escaping (RoasterResponse?, Error?) -> Void) {
        let request = HTTPRequest(method: .get,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/roasters/\(roasterId)",
            queryItems: nil,
            body: nil,
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
