//
//  Expo1900 - ItemDetailViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    static let viewIdentifier = "itemDetailViewController"
    private var navigationTitle: String
    private var imageName: String
    private var descriptionText: String

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configure()
    }
    
    func configureTitle() {
        navigationItem.title = navigationTitle
    }
    
    func configure() {
        descriptionLabel.text = descriptionText
        imageView.image = UIImage(named: imageName)
        
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appDelegate?.shouldSupportAllOrientation = true
    }
    
    init?(item: ExhibitItem, coder: NSCoder) {
        self.navigationTitle = item.name
        self.descriptionText = item.description
        self.imageName = item.imageName
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
