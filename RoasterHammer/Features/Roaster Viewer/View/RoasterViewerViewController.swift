//
//  RoasterViewerViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/27/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

struct UnitDisplayModel: Codable {
    let role: RoleResponse
    let unit: SelectedUnitResponse
}

/*
 [detachment1, UnitDisplayModel, UnitDisplayModel, detachment2, UnitDisplayModel]
 */
final class RoasterViewerViewController: RoasterViewerLayoutViewController {
    var interactor: RoasterViewerViewOutput!
    var router: RoasterViewerRouter!
    private let roaster: RoasterResponse
    private lazy var dataSource: [Int: Codable] = {
        var result = [Int: Codable]()
        var index = 0
        for detachment in roaster.detachments {
            result[index] = detachment
            index += 1

            for role in detachment.roles {
                for unit in role.units {
                    let unitDisplay = UnitDisplayModel(role: role, unit: unit)
                    result[index] = unitDisplay
                    index += 1
                }
            }
        }

        return result
    }()
    private lazy var numberOfItems: Int = {
        var numberOfItems = roaster.detachments.count

        for detachment in roaster.detachments {
            numberOfItems += detachment.roles.reduce(0) { $0 + $1.units.count }
        }

        return numberOfItems
    }()

    init(roaster: RoasterResponse) {
        self.roaster = roaster
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        router.navigationController = navigationController

        collectionView.dataSource = self
        collectionView.delegate = self

        let closeBarButtonItem = UIBarButtonItem(title: "Close",
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(closeBarButtonItemTapped(_:)))
        navigationItem.leftBarButtonItem = closeBarButtonItem

        assert(dataSource.keys.count == numberOfItems, "Invalid data source")
    }

    // MARK: - Private Functions

    @objc private func closeBarButtonItemTapped(_ sender: UIBarButtonItem) {
        router.dismiss()
    }

//    private func dataSource<T: Codable>(roaster: RoasterResponse) -> [Int: T] {
//        var result = [Int: T]()
//        var index = 0
//        for detachment in roaster.detachments {
//            if let detachment = detachment as? T {
//                result[index] = detachment
//                index += 1
//            }
//
//            for role in detachment.roles {
//                for unit in role.units {
//                    let unitDisplay = UnitDisplayModel(role: role, unit: unit)
//                    if let unitDisplay = unitDisplay as? T {
//                        result[index] = unitDisplay
//                    }
//                }
//            }
//        }
//
//        return result
//    }

}

extension RoasterViewerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let detachment = dataSource[indexPath.row] as? DetachmentResponse {
            let cell: RoasterSelectedDetachmentCollectionViewCell = collectionView.dequeueIdentifiableCell(for: indexPath)
            cell.setupWithDetachment(detachment)
            return cell
        } else if let unitDisplay = dataSource[indexPath.row] as? UnitDisplayModel {
            let cell: RoasterSelectedModelCollectionViewCell = collectionView.dequeueIdentifiableCell(for: indexPath)
            let unit = unitDisplay.unit
            cell.setupWithUnit(unit)
            return cell
        }

        assertionFailure("Invalid cell at indexPath: \(indexPath)")
        return UICollectionViewCell()
    }
}

extension RoasterViewerViewController: UICollectionViewDelegate {

}

extension RoasterViewerViewController: RoasterViewerView {

}
