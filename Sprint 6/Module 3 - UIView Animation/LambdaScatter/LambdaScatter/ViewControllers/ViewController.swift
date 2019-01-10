//
//  ViewController.swift
//  LambdaScatter
//
//  Created by Benjamin Hakes on 1/9/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shouldScramble: Int = 1
    var moveDirectionArray: [(xChg: Double, yChg: Double)] = []
    
    let lambdaLogo = UIImageView(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
    
    let lambdaTextView = CustomControl(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 100))
    
    @IBAction func makeMagic(_ sender: Any) {
        
        if shouldScramble == 1 {
            shouldScramble = 0
            
            
            CATransaction.begin()
            CATransaction.setCompletionBlock {
            }
            
            for subView in lambdaTextView.subviews{
                var testPoint: CGPoint
                repeat {
                    testPoint = CGPoint(x: subView.center.x + CGFloat(integerLiteral: Int.random(in: -200...300)) , y: subView.center.y + CGFloat(integerLiteral: Int.random(in: 0...300)))
                    
                } while !view.bounds.contains(testPoint)
                
                print("(\(testPoint.x),\(testPoint.y))")
                print(view.bounds.contains(testPoint))
                
                subView.performFlare(x: testPoint.x - subView.center.x, y: testPoint.y - subView.center.y)
                
            }
            
            UIView.animate(withDuration: 1) {
                self.lambdaLogo.alpha = 0.0
            }
            
            CATransaction.commit()
            
            
        } else {
            shouldScramble = 1
            
            CATransaction.begin()
            CATransaction.setCompletionBlock {
            }
            for subView in lambdaTextView.subviews{
                
                subView.performUnflare()
                
            }
            
            UIView.animate(withDuration: 1) {
                self.lambdaLogo.alpha = 1.0
            }
            
            CATransaction.commit()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lambdaLogo.image = UIImage(named: "lambda")
        view.addSubview(lambdaLogo)
        
        lambdaTextView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lambdaTextView)

        let centerXConstraint = NSLayoutConstraint(
            item: lambdaTextView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
        
        let topConstraint = NSLayoutConstraint(
            item: lambdaTextView,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1.0,
            constant: 100.0)
 
        NSLayoutConstraint.activate([centerXConstraint, topConstraint])
    }


}

