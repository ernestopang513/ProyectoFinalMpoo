//
//  SchoolViewController.swift
//  ProyectoFinal
//
//  Created by Ernesto Pang on 11/3/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class SchoolViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    struct places{
        var place: String
        var image: String
        var score: Double
        var school: String
    }
    @IBOutlet weak var collection: UICollectionView!
    var listOfPlaces = [places]()
    var listOfUsers = [Usuarios]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfPlaces.append(places(place: "First Place", image: "Fi", score: 4993, school: "Facultad de ingenieria"))
        listOfPlaces.append(places(place: "Second Place", image: "Fca", score: 43542, school: "Facultad de contaduria"))
        listOfPlaces.append(places(place: "Third Place", image: "Unam", score: 4993, school: "Some school"))
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfPlaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! ItemCollectionViewCell
        
        cell.school.text = listOfPlaces[indexPath.row].school
        cell.place.text = listOfPlaces[indexPath.row].place
        cell.image.image = UIImage(named: listOfPlaces[indexPath.row].image)
        
        return cell
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

