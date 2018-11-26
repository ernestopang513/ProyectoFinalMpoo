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
                if  let dato = defaults.object(forKey: "list") {
                    var decodeData = try? JSONDecoder().decode([Usuarios].self, from: dato as! Data)
                    decodeData?.append(Usuarios(nameOfUsuario: name, password: clave, estado: false,school: "", score: 0, aboutMe: "", verificado: false))
                    let encodeData = try? JSONEncoder().encode(decodeData)
                    defaults.set(encodeData, forKey: "list")
                    OK()
                    
                }else{
                    var list = [Usuarios]()
                    list.append(Usuarios(nameOfUsuario: name, password: clave, estado: false,school: "", score: 0, aboutMe: "", verificado: false))
                    let encodeData = try? JSONEncoder().encode(list)
                    defaults.set(encodeData, forKey: "list")
                }
            }else {
                PasswordsDoNotMatch()
                //nameOfUser.text = "no clave"
                
            }
            
        }else {
            FillInAllTheFields()
            //user.text = "Rellena los campos"
        }
    }
    
     func PasswordsDoNotMatch() {
        
        let alertVC = UIAlertController(title: "Upss", message: "Passwords do not match", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { action in
            
           
        }
        
        
        
        alertVC.addAction(okAction)
        
        
        self.present(alertVC, animated: true, completion: nil)
    }
    func FillInAllTheFields() {
        
        let alertVC = UIAlertController(title: "Wop", message: "Fill in all the fields", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { action in
            
            
        }
        
        
        
        alertVC.addAction(okAction)
        
        
        self.present(alertVC, animated: true, completion: nil)
    }
    func OK() {
        
        let alertVC = UIAlertController(title: "Perfect", message: "You are registered", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { action in
            
            
        }
        
        
        
        alertVC.addAction(okAction)
        
        
        self.present(alertVC, animated: true, completion: nil)
    }
    @IBOutlet weak var user: UILabel!
    
    @IBOutlet weak var clave: UILabel!
    
}
