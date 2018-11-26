//
//  ViewController.swift
//  ProyectoFinal
//
//  Created by Ernesto Pang on 11/2/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //var listOfUsers = [Usuarios]()
    
    
    
    
    @IBOutlet weak var user: UITextField!
    

    
    @IBOutlet weak var clave: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        let defaults = UserDefaults.standard
        
        if let dato = defaults.object(forKey: "logIn")  {
            let decodeSesion = try? JSONDecoder().decode(Usuarios.self, from: dato as! Data)
            if decodeSesion?.estado == true {
                performSegue(withIdentifier: "SignIn", sender: nil)
            }
            
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindView (segue: UIStoryboardSegue){
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        user.text = ""
        clave.text = ""
       
        
        
    }
    
    @IBAction func SignIn(_ sender: UIButton) {
       //performSegue(withIdentifier: "SignIn", sender: nil)
        let defaults = UserDefaults.standard
        if let dato = defaults.object(forKey: "list"), let nombre = user.text, let cl = clave.text{
            let decodeData = try? JSONDecoder().decode([Usuarios].self, from: dato as! Data)
            for i in decodeData!{
                if i.nameOfUsuario == nombre && i.password == cl{
                    var logIn = i
                    logIn.estado = true
                    print("Perro")
                    print(logIn.nameOfUsuario)
                    let encodeData = try? JSONEncoder().encode(logIn)
                    defaults.set(encodeData, forKey: "logIn")
                    performSegue(withIdentifier: "SignIn", sender: nil)
                }
            }
            notRegistered()
            
            //user.text = "No estas regristado"
        }else{
            notRegistered()
            //user.text = "No estas registrado"
            //print("No estas registrado")
        }
    }
    func notRegistered() {
        
        let alertVC = UIAlertController(title: "Wop", message: "It seems that you are not registered", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { action in
            
            
        }
        
        
        
        alertVC.addAction(okAction)
        
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
}
