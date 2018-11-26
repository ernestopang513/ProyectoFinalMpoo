//
//  SignUpViewController.swift
//  ProyectoFinal
//
//  Created by Ernesto Pang on 11/2/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //var lista = [Usuarios]()
    @IBOutlet weak var confirmPassword: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var nameOfUser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let defaults = UserDefaults.standard
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        if let name = nameOfUser.text, let clave = password.text, let clave2 = confirmPassword.text, name.count != 0, clave.count != 0, clave2.count != 0 {
            
            if clave == clave2{
                if  var dato = defaults.object(forKey: "list") as? [String]{
                    dato.append("\(name)-\(clave)-")
                    defaults.set(dato, forKey: "list")
                    
                }else{
                    var list = [String]()
                    list.append("\(name)-\(clave)-")
                    defaults.set(list, forKey: "list")
                }
            }else {
                
                nameOfUser.text = "no clave"
                
            }
            
        }else {
            user.text = "Rellena los campos"
        }
    }
    
    @IBOutlet weak var user: UILabel!
    
    @IBOutlet weak var clave: UILabel!
    
}
