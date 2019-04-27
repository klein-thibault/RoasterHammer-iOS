//
//  RoasterViewerViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/27/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class RoasterViewerViewController: RoasterViewerLayoutViewController {
    var interactor: RoasterViewerViewOutput!
    var router: RoasterViewerRouter!
    private let roaster: RoasterResponse

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
    }

    // MARK: - Private Functions

    @objc private func closeBarButtonItemTapped(_ sender: UIBarButtonItem) {
        router.dismiss()
    }

}

extension RoasterViewerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RoasterSelectedModelCollectionViewCell = collectionView.dequeueIdentifiableCell(for: indexPath)

        let unit = roaster.detachments[0].roles[1].units[0]
        cell.setupWithUnit(unit)

        return cell
    }
}

extension RoasterViewerViewController: UICollectionViewDelegate {

}

extension RoasterViewerViewController: RoasterViewerView {

}
