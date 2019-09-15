//
//  ViewController.swift
//  ImageViewZoomDemo
//
//  Created by Amsaraj Mariappan on 15/9/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewHeight: CGFloat = self.view.bounds.size.height
        let viewWidth: CGFloat = self.view.bounds.size.width
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        scrollView.isPagingEnabled = true
        
        let animals = ["tiger","horse","lion","rabbit","elephant"]
        var xPostion: CGFloat = 0
        
        for animal in animals {
            let view = UIView(frame: CGRect(x: xPostion, y: 0, width: viewWidth, height: viewHeight))
            xPostion += viewWidth
            let imageView = ImageViewZoom(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            
            imageView.setup()
            imageView.imageScrollViewDelegate = self
            imageView.imageContentMode = .aspectFit
            imageView.initialOffset = .center
            imageView.display(image: UIImage(named: animal)!)
            
            view.addSubview(imageView)
            scrollView.addSubview(view)
        }
        scrollView.contentSize = CGSize(width: xPostion, height: viewHeight)
        self.view.addSubview(scrollView)
    }

}

extension ViewController: ImageViewZoomDelegate {
    func imageScrollViewDidChangeOrientation(imageViewZoom: ImageViewZoom) {
        print("Did change orientation")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming at scale \(scale)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll at offset \(scrollView.contentOffset)")
    }
}

