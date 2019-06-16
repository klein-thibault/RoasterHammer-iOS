//
//  HTTPClient.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol HTTPClient {

    func perform(request: HTTPRequest,
                 completion: @escaping (_ response: HTTPResponse?, _ error: Error?) -> Void)

}
