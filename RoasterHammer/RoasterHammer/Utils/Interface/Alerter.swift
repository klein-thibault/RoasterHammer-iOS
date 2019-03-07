//
//  Alerter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class Alerter {
    func informationalAlert(title: String, message: String) -> UIViewController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(dismissAction)

        return alert
    }

    func informationalAlertWithTextField(title: String,
                                         message: String,
                                         textFieldPlaceholder: String,
                                         completion: @escaping (String?) -> Void) -> UIViewController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = textFieldPlaceholder
        }
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            guard let textField = alert.textFields?.first else {
                completion(nil)
                return
            }

            completion(textField.text)
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)

        alert.addAction(confirmAction)
        alert.addAction(dismissAction)

        return alert
    }
}
