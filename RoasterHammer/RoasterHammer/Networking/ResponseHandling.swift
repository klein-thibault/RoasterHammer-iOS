//
//  ResponseHandling.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import Alamofire

protocol ResponseHandling {
    func handleResponse(response: DataResponse<Data>,
                        completion: @escaping (HTTPResponse?, Error?) -> Void)
}

extension ResponseHandling {
    func handleResponse(response: DataResponse<Data>,
                        completion: @escaping (HTTPResponse?, Error?) -> Void) {
        if let error = response.result.error {
            completion(nil, error)
        }

        guard let data = response.result.value else {
            completion(nil, response.result.error)
            return
        }

        let httpResponse = HTTPResponse(data: data, statusCode: nil)
        completion(httpResponse, nil)
    }
}
