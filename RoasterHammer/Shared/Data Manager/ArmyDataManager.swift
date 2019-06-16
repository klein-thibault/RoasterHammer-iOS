//
//  ArmyDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

final class ArmyDataManager: BaseDataManager {
    func getArmies(completion: @escaping ([ArmyResponse]?, Error?) -> Void) {
        let request = HTTPRequest(method: .get,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/armies",
                                  queryItems: nil,
                                  body: nil,
                                  headers: environmentManager.currentEnvironment.defaultHTTPHeaders)

        httpClient.perform(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let armies: [ArmyResponse] = try JSONDecoder().decodeResponseArray(from: data)
                completion(armies, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
