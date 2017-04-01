//
//  SecondViewController.swift
//  ViewControllerDescribableTest
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit
import ViewControllerDescribable

final class SecondViewController: UIViewController {
    @IBOutlet fileprivate weak var firstNameLabel: UILabel?

    var firstName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel?.text = firstName
    }
}

extension SecondViewController: ViewControllerDescribable {
    static var storyboardName: StoryboardNameDescribable {
        return UIStoryboard.Name.profile
    }
}
