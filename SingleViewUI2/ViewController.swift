//
//  ViewController.swift
//  SingleViewUI2
//
//  Created by Muhammad Fawwaz Mayda on 04/03/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var slides : [Slide] = []
    
    func addSlide() ->[Slide] {
        let slide1 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first! as! Slide
        slide1.scrollImage.image = UIImage(named: "tflogo")
        slide1.scrollHeadline.text = "Hi, to the new TensorFlow 2.0"
        slide1.scrollDetail.text = "Latest release of Google's Open Source Framework"
        
        let slide2 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first! as! Slide
        slide2.scrollImage.image = UIImage(named: "torchlogo")
        slide2.scrollHeadline.text = "Facebook PyTorch"
        slide2.scrollDetail.text = "The most used Framework in Machine Learning Research"
        
        return [slide1,slide2]
        
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: 400, height: 500)
        scrollView.contentSize = CGSize(width: (400) * CGFloat(slides.count), height: 500)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: 400 * CGFloat(i), y: 0, width: 400, height: 500)
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
    }


    @IBAction func glossaryTap(_ sender: UIButton) {
        print("Gloss")
        let vc = WebViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

