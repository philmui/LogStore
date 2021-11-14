//
//  File.swift
//  
//
//  Created by Phil Mui on 11/13/21.
//

import UIKit
import CoreMotion

public class LogTrigger {
    let window: UIWindow?
    let motionManager = CMMotionManager()
    
    public init(in window: UIWindow?) {
        self.window = window
        
        motionManager.startAccelerometerUpdates(to: .main) {
            [weak self] data, error in
            
            guard let data = data else { return }
            if data.acceleration.x < -3 {
                printLog("x acceleration: \(data.acceleration.x)")
                self?.presentLog()
            }
        }
    }
    
    func visibleViewController(from viewController: UIViewController?) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return visibleViewController(from: navigationController.topViewController)
        }
        
        if let tabBarController = viewController as? UITabBarController {
            return visibleViewController(from: tabBarController.selectedViewController)
        }
        
        if let presentedViewController = viewController?.presentedViewController {
            return visibleViewController(from: presentedViewController)
        }
        return viewController
    }
    
    func presentLog() {
        let visible = visibleViewController(from: window?.rootViewController)
        let logViewController = LogViewController()
        visible?.present(logViewController, animated: true)
    }
}
