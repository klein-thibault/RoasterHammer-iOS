//
//  DetachmentDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class DetachmentDataManager: BaseDataManager {
    func getDetachmentTypes(completion: @escaping ([DetachmentShortResponse]?, Error?) -> Void) {
        let request = HTTPRequest(method: .get,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "detachment-types",
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
}
