//
//  AnimationInit.swift
//  RAVirtuaLect
//
//  Created by virtual lecto on 5/22/19.
//  Copyright © 2019 virtual lecto. All rights reserved.
//

import UIKit

class AnimationInit: UIViewController {

    @IBOutlet weak var backgroudimageview: UIImageView!
    
    @IBOutlet weak var logoimageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //applyMotionEffer(toView: backgroudimageview, magnitude: 10)
        //applyMotionEffer(toView: logoimageview, magnitude: 10)
        UIView.animate(withDuration: 1, animations:{
            self.logoimageview.frame.origin.y-=25
        }){_ in
            UIView.animateKeyframes(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.logoimageview.frame.origin.y+=25
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            // code to remove your view
            self.performSegue(withIdentifier: "goToLogin", sender: self)
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func applyMotionEffer (toView view:UIView, magnitude:Float){
      /*  let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        */
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [yMotion]
        //group.motionEffects = [xMotion, yMotion]
        
        view.addMotionEffect(group)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
