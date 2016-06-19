//
//  ShowViewController.swift
//  TableView2
//
//  Created by Forrest Filler on 6/15/16.
//  Copyright © 2016 ForrestFiller. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    var show: Show!

    override func loadView() {
        self.title = self.show.name
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .darkGrayColor()
        
        let showBackdrop = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.height))
        // Gives a square since since height == width for imageView
        showBackdrop.image = UIImage(named: self.show.image)
        view.addSubview(showBackdrop)
        
        let darkScreen = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        darkScreen.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        view.addSubview(darkScreen)
        
        let showImage = UIImageView(frame: CGRect(x: 0, y: 120, width: 160, height: 160))
        showImage.center = CGPointMake(0.5*frame.size.width, showImage.center.y) // center property
        showImage.layer.cornerRadius = 0.5*showImage.frame.size.height
        showImage.layer.masksToBounds = true
        showImage.layer.borderColor = UIColor.whiteColor().CGColor
        showImage.layer.borderWidth = 2
        showImage.image = UIImage(named: self.show.image)
        view.addSubview(showImage)
        
        let font = UIFont(name: "Arial", size: 16)
        let str = NSString(string: self.show.summary)
        
        let reduceCast : String = self.show.cast.reduce("", combine: { $0 == "" ? $1 : $0 + ", " + $1 })
        let cStr = NSString(string: reduceCast)
        print("reduceCast: \(cStr)")
        
        var cBounds = cStr.boundingRectWithSize(
            CGSizeMake(frame.size.width-40, 500),
            options: .UsesLineFragmentOrigin,
            attributes:  [NSFontAttributeName:font!],
            context: nil)
        cBounds.origin.x = 20
        cBounds.origin.y = 500

        var bounds = str.boundingRectWithSize(
            CGSizeMake(frame.size.width-40, 500),
            options: .UsesLineFragmentOrigin,
            attributes:  [NSFontAttributeName:font!],
            context: nil)
        bounds.origin.x = 20
        bounds.origin.y = 300

        let summaryLabel = UILabel(frame: bounds)
        summaryLabel.textColor = .whiteColor()
        summaryLabel.backgroundColor = .clearColor()
        summaryLabel.numberOfLines = 0 // "0" means unlimited. default is "1" which means only 1 line!
        summaryLabel.lineBreakMode = .ByWordWrapping // don't break up words
        summaryLabel.textAlignment = .Center
        summaryLabel.text = self.show.summary
        view.addSubview(summaryLabel)

//        let castLabel = UILabel(frame: cBounds)
        let castLabel = UILabel(frame: CGRect(x: 20, y: 450, width: frame.size.width-40, height: cBounds.size.height))
        castLabel.font = font
        castLabel.textColor = .whiteColor()
        castLabel.backgroundColor = .clearColor()
        castLabel.numberOfLines = 0 // "0" means unlimited. default is "1" which means only one line!
        castLabel.lineBreakMode = .ByWordWrapping // don't break the words up
        castLabel.textAlignment = .Center
        castLabel.text = reduceCast
        view.addSubview(castLabel)
        
        self.view = view //passing off the view to the view controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    

}
