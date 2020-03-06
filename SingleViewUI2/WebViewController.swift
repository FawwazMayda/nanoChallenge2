//
//  WebViewController.swift
//  SingleViewUI2
//
//  Created by Muhammad Fawwaz Mayda on 04/03/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    var urlData : String?;
    var wk : WKWebView?;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: urlData!)
        let req = URLRequest(url: url!)
        wk = WKWebView()
        wk?.load(req)
        wk?.allowsBackForwardNavigationGestures = true
        view = wk
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
