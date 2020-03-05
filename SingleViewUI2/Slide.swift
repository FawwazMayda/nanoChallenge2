//
//  Slide.swift
//  SingleViewUI2
//
//  Created by Muhammad Fawwaz Mayda on 04/03/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

protocol sendURLDelegate {
    func thisIsURL(alamat : String)
}
class Slide: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var myDelegate : sendURLDelegate?
    @IBOutlet weak var scrollImage: UIImageView!
    
    @IBOutlet weak var scrollHeadline: UILabel!
    
    @IBOutlet weak var scrollDetail: UILabel!
    
    var url : String = "https://developer.apple.com";
    
    
    @IBAction func urlTap(_ sender: Any) {
        print("TAP \(url)")
        if let x = myDelegate {
            x.thisIsURL(alamat: url)
        }
        else {
            print("Error with delegate")
        }
    }
    
    
}
