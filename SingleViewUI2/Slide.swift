//
//  Slide.swift
//  SingleViewUI2
//
//  Created by Muhammad Fawwaz Mayda on 04/03/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class Slide: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var scrollImage: UIImageView!
    
    @IBOutlet weak var scrollHeadline: UILabel!
    
    @IBOutlet weak var scrollDetail: UILabel!
    
    var url : String = "";
}
