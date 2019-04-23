//
//  AlamofireHTTPClient.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import Alamofire

final class AlamofireHTTPClient: HTTPClient, ResponseHandling {
    func perform(request: HTTPRequest, completion: @escaping (HTTPResponse?, Error?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(request.endpoint,
                          method: request.method.alamofireMethod,
                          parameters: request.body,
                          encoding: JSONEncoding.default,
                          headers: request.headers)
            .responseData { [weak self] (response: DataResponse<Data>) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self?.handleResponse(response: response, completion: completion)
        }
    }
}

extension HTTPMethod {

    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .get: return Alamofire.HTTPMethod.get
        case .post: return Alamofire.HTTPMethod.post
        case .delete: return Alamofire.HTTPMethod.delete
        case .put: return Alamofire.HTTPMethod.put
        case .patch: return Alamofire.HTTPMethod.patch
        }
    }

}
