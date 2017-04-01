//
//  ThirdViewController.swift
//  ViewControllerDescribableTest
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit
import ViewControllerDescribable

final class ThirdViewController: UIViewController {
    @IBOutlet fileprivate weak var firstNameLabel: UILabel?
    
    var firstName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel?.text = firstName
    }
}

extension ThirdViewController: ViewControllerDescribable {
    static var storyboardName: StoryboardNameDescribable {
        return UIStoryboard.Name.profile
    }
    
    static var navigationControllerId: String? {
        return "ThirdNavigationController"
    }
}

private extension ThirdViewController {
    @IBAction func closeBarButtonItemPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
