//
//  LoadingViewController.swift
//  Loading UI
//
//  Created by Lisa Sampson on 9/19/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(indeterminateLoadingView)
        
        indeterminateLoadingView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = indeterminateLoadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let centerX = indeterminateLoadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let widthConstraint = indeterminateLoadingView.widthAnchor.constraint(equalToConstant: 150)
        let heightConstraint = indeterminateLoadingView.heightAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([centerY, centerX, widthConstraint, heightConstraint])
    }
    
    public func startAnimation() {
        indeterminateLoadingView.startAnimating()
    }
    
    public func stopAnimation() {
        indeterminateLoadingView.stopAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.indeterminateLoadingView.isHidden = true
        }
    }

    let indeterminateLoadingView = IndeterminateLoadingView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
}
