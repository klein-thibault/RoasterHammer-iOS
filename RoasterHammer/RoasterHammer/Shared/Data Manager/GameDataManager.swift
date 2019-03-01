//
//  GameDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class GameDataManager: BaseDataManager {
    private let accountStore = AccountDataStore()

    func createGame(completion: @escaping (GameResponse?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        let request = HTTPRequest(method: .post,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "games",
                                  queryItems: nil,
                                  body: nil,
                                  headers: environmentManager.currentEnvironment.basicAuthHeaders(token: token))
        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let game: GameResponse = try JSONDecoder().decodeResponse(from: data)
                completion(game, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func getUserGames(completion: @escaping ([GameResponse]?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        let request = HTTPRequest(method: .get,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "games",
                                  queryItems: nil,
                                  body: nil,
                                  headers: environmentManager.currentEnvironment.basicAuthHeaders(token: token))
        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let games: [GameResponse] = try JSONDecoder().decodeResponseArray(from: data)
                completion(games, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func getGame(byId gameId: Int, completion: @escaping (GameResponse?, Error?) -> Void) {
        guard let token = accountStore.getAuthToken() else {
            completion(nil, RoasterHammerError.userNotLoggedIn)
            return
        }

        let request = HTTPRequest(method: .get,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "games/\(gameId)",
                                  queryItems: nil,
                                  body: nil,
                                  headers: environmentManager.currentEnvironment.basicAuthHeaders(token: token))
        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let game: GameResponse = try JSONDecoder().decodeResponse(from: data)
                completion(game, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
