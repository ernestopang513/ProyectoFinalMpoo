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
    
    var listuki = [String]()
    var list = [String]()
    @IBOutlet weak var clave: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        // Do any additional setup after loading the view.
        
        list = defaults.object(forKey: "list") as? [String] ?? [String]()
        print(list)
        var  carro = [Usuarios]()
        carro.append(Usuarios(nameOfUsuario: "Ernesto", password: "123", estado: false))
        let encodeData = try? JSONEncoder().encode(carro)
        print(carro)
        defaults.set(encodeData, forKey: "naves")
        var carrot = defaults.object(forKey: "naves") //as? [Usuarios]
        var manzana = try? JSONDecoder().decode([Usuarios].self, from: carrot as! Data)
        print(manzana![0].password)
        
        
        
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
       performSegue(withIdentifier: "SignIn", sender: nil)
        let defaults = UserDefaults.standard
        if let dato = defaults.object(forKey: "list") as? [String], let nombre = user.text, let cl = clave.text{
            print (dato)
            var i = 1
            var name = ""
            var clave = ""
            for x in dato{
                var cadena = x
                for m in x{
                    if m == "-"{
                        break
                    }
                    name = name + String(m)
                    i += 1
                }
                cadena.removeFirst(i)
                print(cadena)
                for m in cadena{
                    if m == "-"{
                        //i += 1
                        break
                    }
                    clave = clave + String(m)
                }
                print(name)
                print(clave)
                if name == nombre && clave == cl{
                    performSegue(withIdentifier: "SignIn", sender: nil)
                }
                cadena = ""
                name = ""
                clave = ""
                i = 1
            }
            //user.text = "No estas regristado"
        }else{
            user.text = "No estas registrado"
            //print("No estas registrado")
        }
    }
    
    
    
}
