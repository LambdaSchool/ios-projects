//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Angel Buenrostro on 1/30/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shouldScramble : Bool = false
    var lambda : [UILabel] = []
    var imageLambda: UIImageView = UIImageView()
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        shouldScramble = !shouldScramble
        
        if shouldScramble {
            
            let transformLayer = CATransformLayer()
            var perspective = CATransform3DIdentity
            perspective.m34 = -1/500
            transformLayer.transform = perspective
//            transformLayer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
            transformLayer.addSublayer(imageLambda.layer)
            view.layer.addSublayer(transformLayer)
            
            UIView.animate(withDuration: 3) {
                self.imageLambda.layer.transform = CATransform3DMakeRotation(-0.5, 1, 0, 0)
            }
            
            
            
            for labels in lambda {
                
                UIView.animate(withDuration: 3.0, animations: {
                    labels.textColor = UIColor.FlatColor.ColorHunt.DiscoBlue
                    labels.backgroundColor = UIColor.FlatColor.Gray.AlmondFrost .withAlphaComponent(0.50)
                    self.imageLambda.alpha = 0
                    
                }, completion: nil)
                UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                        labels.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
                        labels.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...(self.view.frame.width - labels.center.x) - 50), y: CGFloat.random(in: 0...self.view.bounds.maxY - 100))
                    })
                    
                    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                        labels.transform = CGAffineTransform(rotationAngle: CGFloat.pi/3)
                        labels.transform = CGAffineTransform(translationX: CGFloat.random(in: 0...(self.view.frame.width - labels.center.x) - 50), y: CGFloat.random(in: 0...self.view.bounds.maxY - 100))
                        
                    })
                    
                }, completion: nil)
            }
            
        } else {
            for labels in lambda {
                UIView.animate(withDuration: 3) {
                    self.imageLambda.transform = .identity
                }
                UIView.animate(withDuration: 3.0, animations: {
                    labels.transform = .identity
                    labels.textColor = .black
                    labels.backgroundColor = .clear
                    self.imageLambda.alpha = 1
                }, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let font = UIFont(name: "Avenir-Black", size: 40)!
        
        let charL = UILabel()
        charL.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charL)
        charL.text = "L"
        charL.font = font
        lambda.append(charL)
        
        let charA = UILabel()
        charA.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charA)
        charA.text = "A"
        charA.font = font
        lambda.append(charA)
        
        let charM = UILabel()
        charM.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charM)
        charM.text = "M"
        charM.font = font
        lambda.append(charM)
        
        let charB = UILabel()
        charB.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charB)
        charB.text = "B"
        charB.font = font
        lambda.append(charB)
        
        let charD = UILabel()
        charD.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charD)
        charD.text = "D"
        charD.font = font
        lambda.append(charD)
        
        let charA2 = UILabel()
        charA2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(charA)
        charA2.text = "A"
        charA2.font = font
        lambda.append(charA2)
        
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(charL)
        stackView.addArrangedSubview(charA)
        stackView.addArrangedSubview(charM)
        stackView.addArrangedSubview(charB)
        stackView.addArrangedSubview(charD)
        stackView.addArrangedSubview(charA2)
        
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
            stackView.centerXAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.centerXAnchor, multiplier: 1)
            ])
        
        
        let spacePaperPlane = "spacePaperPlane.png"
        let spacePlane = UIImage(named: spacePaperPlane)
        imageLambda = UIImageView(image: spacePlane)
        
        imageLambda.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageLambda.contentMode = .scaleAspectFit
        imageLambda.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageLambda)
        
        NSLayoutConstraint.activate([
            imageLambda.centerXAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.centerXAnchor, multiplier: 1),
            imageLambda.centerYAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.centerYAnchor, multiplier: 1),
            ])
        
    }

    
    
    
}
