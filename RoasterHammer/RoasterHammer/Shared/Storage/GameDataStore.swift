//
//  GameDataStore.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class GameDataStore {
    private let store = UserDefaultStore()
    private let gameIdStoringKey = "gameIdKey"

    @discardableResult
    func storeGameId(gameId: Int) -> Bool {
        var gameIdCopy = gameId
        let data = Data(bytes: &gameIdCopy, count: MemoryLayout.size(ofValue: gameIdCopy))
        return store.store(data: data, key: gameIdStoringKey)
    }

    func getGameId() -> Int? {
        guard let gameIdData = store.get(forKey: gameIdStoringKey) else {
            return nil
        }

        let gameId: Int = gameIdData.withUnsafeBytes { $0.pointee }
        return gameId
    }
}
