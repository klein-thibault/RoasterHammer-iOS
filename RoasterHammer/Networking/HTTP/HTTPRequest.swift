//
//  HTTPRequest.swift
//  PCFSwift
//
//  Created by Thibault Klein on 2/19/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

typealias Headers = [String: String]
typealias QueryItems = [String: String]

struct HTTPRequest {
    let method: HTTPMethod
    let baseURL: URL
    let path: String
    let queryItems: QueryItems?
    let body: JSON?
    let headers: Headers?

    var endpoint: URL {
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return baseURL.appendingPathComponent(path)
        }

        components.path.append(path)
        let query = queryItems?.map { URLQueryItem(name: $0.key, value: $0.value) }
        components.queryItems = query
        return components.url ?? baseURL.appendingPathComponent(path)
    }

    init(method: HTTPMethod,
                baseURL: URL,
                path: String,
                queryItems: QueryItems?,
                body: JSON?,
                headers: Headers?) {
        self.method = method
        self.baseURL = baseURL
        self.path = path
        self.queryItems = queryItems
        self.body = body
        self.headers = headers
    }

}

// MARK: Factory functions

extension HTTPRequest {

    func with(additionalQueryItems: QueryItems) -> HTTPRequest {
        let newQueryItems: QueryItems = (queryItems == nil) ? [:] : queryItems!.combineWith(additionalQueryItems)
        return with(newQueryItems: newQueryItems)
    }

    func with(newBody body: JSON) -> HTTPRequest {
        return HTTPRequest(method: method,
                           baseURL: baseURL,
                           path: path,
                           queryItems: queryItems,
                           body: body,
                           headers: headers)
    }

    func with(newQueryItems queryItems: QueryItems) -> HTTPRequest {
        return HTTPRequest(method: method,
                           baseURL: baseURL,
                           path: path,
                           queryItems: queryItems,
                           body: body,
                           headers: headers)
    }

}
