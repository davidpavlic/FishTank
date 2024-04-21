//
//  UIViewController.swift
//  FishTank
//
//  Created by David Pavlic on 21.04.2024.
//

import SwiftUI

extension UIViewController {
    func applyBackgroundStyle() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 0.6, green: 0.85, blue: 1, alpha: 1).cgColor,
                                UIColor.white.cgColor]
        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
