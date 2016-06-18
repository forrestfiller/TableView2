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
        
        let showBackdrop = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.height)) // want a square so use the same height and width!
        showBackdrop.image = UIImage(named: self.show.image)
        view.addSubview(showBackdrop)
        
        let darkScreen = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        darkScreen.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        view.addSubview(darkScreen)
        
        let showImage = UIImageView(frame: CGRect(x: 0, y: 120, width: 160, height: 160))
        showImage.center = CGPointMake(0.5*frame.size.width, showImage.center.y)
        // center property
        showImage.layer.cornerRadius = 0.5*showImage.frame.size.height
        showImage.layer.masksToBounds = true
        showImage.layer.borderColor = UIColor.whiteColor().CGColor
        showImage.layer.borderWidth = 2
        showImage.image = UIImage(named: self.show.image)
        view.addSubview(showImage)
        
        let font = UIFont(name: "Arial", size: 16)
        let str = NSString(string: self.show.summary)
/*        let strCast = Array<String>(self.show.cast)
// @DanKwon: using what we learned in class, I still need to figure out what type of class is an array 
        of strings-- that is also compatible with the boundingRectWithSize below!
        
        var boundsCast = strCast.boundingRectWithSize(CGSizeMake(frame.size.width-50, 510),
            options: .UsesLinesFragmentOrigin,
            attributes: [NSFontAttributeName:font!],
            context: nil)
        bounds.origin.x = 30
        bounds.origin.y = 310
*/
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
        summaryLabel.numberOfLines = 0 // "0" means unlimited. default is "1" which means only one line!
        summaryLabel.lineBreakMode = .ByWordWrapping // don't break the words up
        summaryLabel.textAlignment = .Center
        summaryLabel.text = self.show.summary
        view.addSubview(summaryLabel)
        
        var castString = ""
        for s in show.cast {
            castString += "\(s),"
// @DanKwon:   ---Stuart suggested this block above and the block below this one called "castLabel" to sove my issue with Array<String> from the Show.swif file.
        }
        let castLabel = UILabel(frame: bounds)
        castLabel.textColor = .whiteColor()
        castLabel.backgroundColor = .clearColor()
        castLabel.numberOfLines = 0 // "0" means unlimited. default is "1" which means only one line!
        castLabel.lineBreakMode = .ByWordWrapping // don't break the words up
        castLabel.textAlignment = .Center
        castLabel.text = castString
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
