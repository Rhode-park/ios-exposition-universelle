//
//  Expo1900 - ExpositionViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorCountLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureLabel()
    }
    
    private func configureTitle() {
        navigationItem.title = NameSpace.homeViewTitle
    }
    
    private func configureLabel() {
        let expositionUniverselle = DecodingJson().decodeExpositionJson()
        
        titleLabel.text = expositionUniverselle.title
        visitorCountLabel.text = NameSpace.leftVisitorCountString
        + String(expositionUniverselle.visitorCount) + NameSpace.rightVisitorCountString
        locationLabel.text = NameSpace.leftLocationString + expositionUniverselle.location
        durationLabel.text = NameSpace.leftDurationString + expositionUniverselle.duration
        descriptionLabel.text = expositionUniverselle.description
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        visitorCountLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        locationLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        durationLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        titleLabel.adjustsFontForContentSizeCategory = true
        visitorCountLabel.adjustsFontForContentSizeCategory = true
        locationLabel.adjustsFontForContentSizeCategory = true
        durationLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.adjustsFontForContentSizeCategory = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appDelegate?.shouldSupportAllOrientation = false
        hideNavigationBar()
    }
    
    private func hideNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func touchUpInsideItemButton(_ sender: UIButton) {
        guard let itemsView: ItemListViewController = self.storyboard?.instantiateViewController(withIdentifier: ItemListViewController.viewIdentifier) as? ItemListViewController else { return }
        
        navigationController?.pushViewController(itemsView, animated: true)
    }
}
