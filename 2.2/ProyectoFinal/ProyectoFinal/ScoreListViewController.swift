//
//  ScoreListViewController.swift
//  ProyectoFinal
//
//  Created by Ernesto Pang on 11/3/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class ScoreListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    struct Usuarios{
        var name: String
        var score: String
    }
    
    
    
    var listOfUsers = [Usuarios]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfUsers.append(Usuarios(name: "Ernesto", score: "6040"))
        listOfUsers.append(Usuarios(name: "Ian", score: "4000"))
        listOfUsers.append(Usuarios(name: "Juan", score: "3000"))
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell2.textLabel?.text = "\(listOfUsers[indexPath.row].name) Score: \(listOfUsers[indexPath.row].score)"
        
        return cell2
    }
    
    
    
 
    
}
