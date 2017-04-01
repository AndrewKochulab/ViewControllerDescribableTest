//
//  ViewController.swift
//  ViewControllerDescribableTest
//
//  Created by Andrew Kochulab on 4/1/17.
//  Copyright © 2017 MacInsider. All rights reserved.
//

import UIKit
import ViewControllerDescribable

enum TransitionType: String {
    case push = "Push",
    pushWithConfiguration = "Push with configuration",
    simplePush = "Simple push",
    simplePushWithConfiguration = "Simple push with configuration",
    simplePresent = "Simple present",
    simplePresentWithConfiguration = "Simple present with configuration",
    simplePresentWithNavigation = "Simple present with navigation"
}

final class MainViewController: UIViewController {
    @IBOutlet fileprivate weak var contentTableView: UITableView?
    
    fileprivate let types = [TransitionType.push,
                       .pushWithConfiguration,
                       .simplePush,
                       .simplePushWithConfiguration,
                       .simplePresent,
                       .simplePresentWithConfiguration,
                       .simplePresentWithNavigation]
    
    fileprivate let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        navigationItem.backBarButtonItem = UIBarButtonItem(title: String(), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .white
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = types[indexPath.row].rawValue

        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let currentType = types[indexPath.row]
        
        switch currentType {
            case .push:
                push()
                
            case .pushWithConfiguration:
                pushWithConfiguration()
                
            case .simplePush:
                simplePush()
                
            case .simplePushWithConfiguration:
                simplePushWithConfiguration()

            case .simplePresent:
                simplePresent()
                
            case .simplePresentWithConfiguration:
                simplePresentWithConfiguration()
                
            case .simplePresentWithNavigation:
                simplePresentWithConfigurationAndNavigation()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Helpers
private extension MainViewController {
    func push() {
        let viewController = SecondViewController.instantiated()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushWithConfiguration() {
        let viewController = SecondViewController.instantiated { vc in
            vc.firstName = "Hello"
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func simplePush() {
        navigationController?.push(SecondViewController.self)
    }
    
    func simplePushWithConfiguration() {
        navigationController?.push(SecondViewController.self, configuration: { vc in
            vc.firstName = "Hello"
        })
    }
    
    func simplePresent() {
        present(ThirdViewController.self)
    }
    
    func simplePresentWithConfiguration() {
        present(ThirdViewController.self, configuration: { vc in
            vc.firstName = "Hello"
        }, completion: { vc in
            // something else
        })
    }
    
    func simplePresentWithConfigurationAndNavigation() {
        present(ThirdViewController.self, navigationEnabled: true, animated: false, configuration: { vc in
            vc.firstName = "Hello"
        })
    }
}
