//
//  UIStoryboard.swift
//  ViewControllerDescribableTest
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit
import ViewControllerDescribable

extension UIStoryboard {
    enum Name: String, StoryboardNameDescribable {
        case main = "Main",
        profile = "Profile"
    }
}
