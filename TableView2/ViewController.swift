//
//  ViewController.swift
//  TableView2
//
//  Created by Forrest Filler on 6/15/16.
//  Copyright © 2016 ForrestFiller. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var showsTable: UITableView!
    var comediesArray = Array<Show>()
    var dramasArray = Array<Show>()
    var realitiesArray = Array<Show>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let howImetYourMother = Show()
        howImetYourMother.name = "How I Met Your Mother"
        howImetYourMother.network = "NBC"
        howImetYourMother.image = "howimetyourmother.png"
        howImetYourMother.type = "comedy"
        howImetYourMother.summary = "A father recounts to his children, through a series of flashbacks, the journey he and his four best friends took leading up to him meeting their mother."
        howImetYourMother.cast.append("Josh Radnor")
        howImetYourMother.cast.append("Jason Segel")
        howImetYourMother.cast.append("Cobie Smulders")
        self.comediesArray.append(howImetYourMother)
        
        let twoAndAHalfMen = Show()
        twoAndAHalfMen.name = "Two And A Half Men"
        twoAndAHalfMen.network = "CBS"
        twoAndAHalfMen.image = "twoandahalfmen.png"
        twoAndAHalfMen.type = "comedy"
        twoAndAHalfMen.summary = "A hedonistic jingle writer's free-wheeling life comes to an abrupt halt when his brother and 10-year-old nephew move into his beach-front house."
        twoAndAHalfMen.cast.append("Jon Cryer")
        twoAndAHalfMen.cast.append("Ashton Kutcher")
        twoAndAHalfMen.cast.append("Angus T. Jones")
        self.comediesArray.append(twoAndAHalfMen)
        
        let gameOfThrones = Show()
        gameOfThrones.name = "Game of Thrones"
        gameOfThrones.network = "HBO"
        gameOfThrones.image = "gameofthrones.png"
        gameOfThrones.type = "drama"
        gameOfThrones.summary = "While a civil war brews between several noble families in Westeros, the children of the former rulers of the land attempt to rise up to power. Meanwhile a forgotten race, bent on destruction, plans to return after thousands of years in the North."
        gameOfThrones.cast.append("Emilia Clarke")
        gameOfThrones.cast.append("Peter Dinklage")
        gameOfThrones.cast.append("Kit Harington")
        self.dramasArray.append(gameOfThrones)
        
        let modernFamily = Show()
        modernFamily.name = "Modern Family"
        modernFamily.network = "ABC"
        modernFamily.image = "modernfamily.png"
        modernFamily.type = "drama"
        modernFamily.summary = "Three different, but related families face trials and tribulations in their own uniquely comedic ways."
        modernFamily.cast.append("Ed O'Neill")
        modernFamily.cast.append("Sofía Vergara")
        modernFamily.cast.append("Julie Bowen")
        self.dramasArray.append(modernFamily)
        
        let theRealHousewivesOfMelbourne = Show()
        theRealHousewivesOfMelbourne.name = "The Real Housewives of Melbourne"
        theRealHousewivesOfMelbourne.network = "Bravo"
        theRealHousewivesOfMelbourne.image = "realhousewivesofmelbourne.png"
        theRealHousewivesOfMelbourne.type = "realities"
        theRealHousewivesOfMelbourne.summary = "The Real Housewives of Melbourne follows both the professional and personal lives of several women living in Melbourne, Australia. The reality series premiered on 23 February 2014."
        theRealHousewivesOfMelbourne.cast.append("Jackie Gillies")
        theRealHousewivesOfMelbourne.cast.append("Gina Liano")
        theRealHousewivesOfMelbourne.cast.append("Janet Roach")
        self.realitiesArray.append(theRealHousewivesOfMelbourne)
        
        let theRealWorld = Show()
        theRealWorld.name = "The Real World"
        theRealWorld.network = "MTV"
        theRealWorld.image = "therealworld.png"
        theRealWorld.type = "realities"
        theRealWorld.summary = "Real World (formerly known as The Real World from 1992 to 2013) is a scripted reality television series on MTV originally produced by Mary-Ellis Bunim and Jonathan Murray. First broadcast in 1992."
        theRealWorld.cast.append("Mary-Ellis Bunim")
        theRealWorld.cast.append("Jonathan Murray")
        theRealWorld.cast.append("Matt Roush")
        self.realitiesArray.append(theRealWorld)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return self.comediesArray.count
        }
        if (section == 1) {
            return self.dramasArray.count
        }
        
        return self.realitiesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            return self.configureCell(cell, indexPath: indexPath)
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        return self.configureCell(cell, indexPath: indexPath)        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var show: Show
        if (indexPath.section == 0){
            show = self.comediesArray[indexPath.row]
        }
        else if (indexPath.section == 1){
            show = self.dramasArray[indexPath.row]
        }
        else {
            show = self.realitiesArray[indexPath.row]
        }
        
        print("didSelectRowAtIndexPath: \(show.name)")
        let showVc = ShowViewController()
        showVc.show = show
        self.navigationController?.pushViewController(showVc, animated: true)
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        var show: Show
        if (indexPath.section == 0) {
            show = self.comediesArray[indexPath.row]
        }
        else if (indexPath.section == 1) {
            show = self.dramasArray[indexPath.row]
        }
        else {
            show = self.realitiesArray[indexPath.row]
        }
        
        cell.textLabel?.text = show.name
        cell.detailTextLabel?.text = show.network
        cell.imageView?.image = UIImage(named: show.image)
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Comedies"
        }
        if (section == 1) {
            return "Dramas"
        }
        
        return "Realities"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

