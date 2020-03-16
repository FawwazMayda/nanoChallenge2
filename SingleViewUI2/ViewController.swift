//
//  ViewController.swift
//  SingleViewUI2
//
//  Created by Muhammad Fawwaz Mayda on 04/03/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit
import  WebKit
class ViewController: UIViewController , WKNavigationDelegate ,sendURLDelegate  {
    
    @IBOutlet weak var scrollContainer: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var quizButton: UIButton!
    
    @IBOutlet weak var glossaryButton: UIButton!
    var slides : [Slide] = []
    var webViewEL : WKWebView = WKWebView()
    var thisURL : String = ""

    func addSlide() ->[Slide] {
        let slide1 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first! as! Slide
        slide1.scrollImage.image = UIImage(named: "satu")
        slide1.scrollHeadline.text = "Reinforcement Learning"
        slide1.scrollDetail.text = "Latest release of Google's Open Source Framework"
        slide1.url = "https://towardsdatascience.com/january-edition-reinforcement-learning-c4501b6e854a"
        slide1.myDelegate = self
        
        let slide2 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first! as! Slide
        slide2.scrollImage.image = UIImage(named: "dua")
        slide2.scrollHeadline.text = "ML in Browser"
        slide2.scrollDetail.text = "The most used Framework in Machine Learning Research"
        slide2.url = "https://towardsdatascience.com/machine-learning-in-the-browser-7fc08858640"
        slide2.myDelegate = self
        
        let slide3 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first! as! Slide
        slide3.scrollImage.image = UIImage(named:"tiga")
        slide3.scrollHeadline.text = "Fairness in AI"
        slide3.scrollDetail.text = "Deep Dive to Apple Offering for Developer"
        slide3.url = "https://towardsdatascience.com/explaining-measures-of-fairness-f0e419d4e0d7"
        slide3.myDelegate = self
        
        let slide4 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first! as! Slide
        slide4.scrollImage.image = UIImage(named : "empat")
        slide4.scrollHeadline.text = "Explaining a LSTM"
        slide4.scrollDetail.text = "One of the crucial architecture the LSTM"
        slide4.url = "https://towardsdatascience.com/on-trolleys-and-missing-the-forest-for-the-trees-or-how-i-went-from-fearing-self-driving-cars-to-a27210456ccf"
        slide4.myDelegate = self
        
        let slide5 : Slide =  Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first! as! Slide
        slide5.scrollImage.image = UIImage(named : "beyondpixel")
        slide5.scrollHeadline.text = "Learning the 3D Environment"
        slide5.scrollDetail.text = "See how Deep Learning Conquer the 3D World"
        slide5.url = "https://thegradient.pub/beyond-the-pixel-plane-sensing-and-learning-in-3d/"
        slide5.myDelegate = self
        return [slide1,slide2,slide4,slide3,slide5]
    }
    
    func thisIsURL(alamat: String) {
        print("Given a URL from Scroll")
        getWebView(alamat: alamat)
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        //width 314 height 258
        scrollView.frame = CGRect(x: 15, y: 0, width: 320, height: 320)
        scrollView.contentSize = CGSize(width: (314) * CGFloat(slides.count), height: 258)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: (314 * CGFloat(i)), y: 0, width: 314, height: 258)
            scrollView.addSubview(slides[i])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slides = addSlide()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
        quizButton.layer.cornerRadius = 7.0
        glossaryButton.layer.cornerRadius = 7.0
        scrollContainer.layer.cornerRadius = 7.0
    }


    @IBAction func glossaryTap(_ sender: UIButton) {
        print("Gloss")
        thisURL = "https://developers.google.com/machine-learning/glossary"
        //getWebView(alamat: "https://developers.google.com/machine-learning/glossary")
        performSegue(withIdentifier: "glossSegue", sender: self)
    }
    
    func getWebView(alamat : String){
        /*
        let url = URL(string: alamat)!
        let req = URLRequest(url: url)
        webViewEL.load(req)
        webViewEL.navigationDelegate = self
        webViewEL.allowsBackForwardNavigationGestures = true
        view = webViewEL
        */
        thisURL = alamat
        performSegue(withIdentifier: "segueWeb", sender: self)
    }
    
    
    @IBAction func quizTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "quizSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="segueWeb") {
            let controller = segue.destination as! WebViewController
            controller.urlData = thisURL
        }
    }
    
}
