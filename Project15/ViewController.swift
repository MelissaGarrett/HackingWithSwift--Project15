//
//  ViewController.swift
//  Project15
//
//  Created by Melissa  Garrett on 2/24/17.
//  Copyright © 2017 MelissaGarrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tap: UIButton!
    
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }
    
    
    @IBAction func tapped(_ sender: UIButton) {
        tap.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            [unowned self] in
            switch self.currentAnimation {
            case 0: // make image view twice its size
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
               
            case 1: // clears out pre-defined transform, resetting changes
                self.imageView.transform = CGAffineTransform.identity
                
            case 2: // move the image 256 pixes from current position
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
              
            case 3: // reset
                self.imageView.transform = CGAffineTransform.identity
                
            case 4:  // amount in radians to rotate
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                
            case 5:  // reset
                self.imageView.transform = CGAffineTransform.identity
               
            case 6: // make the image view almost invisible
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = .green
                
            case 7: // make the image view fully visible
                self.imageView.alpha = 1
                self.imageView.backgroundColor = .clear
                
            default:
                break
            }
        }) { [unowned self] (finished: Bool) in
            self.tap.isHidden = false // make button visible again for more tapping
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

