//
//  glossViewController.swift
//  SingleViewUI2
//
//  Created by Muhammad Fawwaz Mayda on 12/03/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class glossViewController: UIViewController {
    var thisURL : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func charTapped(_ sender: UIButton) {
        if let x = sender.titleLabel?.text {
            print(x.lowercased())
            thisURL = "https://developers.google.com/machine-learning/glossary/#\(x.lowercased())"
        }
        print("TAPPED")
        print(thisURL)
        performSegue(withIdentifier: "glossToWeb", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="glossToWeb") {
            let controller = segue.destination as! WebViewController
            controller.urlData = thisURL
        }
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
