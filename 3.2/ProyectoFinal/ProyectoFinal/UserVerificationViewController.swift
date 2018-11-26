//
//  UserVerificationViewController.swift
//  ProyectoFinal
//
//  Created by MacBook on 07/11/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class UserVerificationViewController: UIViewController {
    
    
    @IBOutlet weak var matricula: UITextField!
    
    @IBOutlet weak var school: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verificationAction(_ sender: UIButton) {
        if school.text?.count != 0 && matricula.text?.count != 0 {
            let schooll = school.text
            let matric = matricula.text
            let defaults = UserDefaults.standard
            if let dato = defaults.object(forKey: "logIn")  {
                var decodeSesion = try? JSONDecoder().decode(Usuarios.self, from: dato as! Data)
                decodeSesion?.school = schooll!
                decodeSesion?.matricula = matric!
                decodeSesion?.verificado = true
                decodeSesion?.score = 1.1
                let encodeSesion = try? JSONEncoder().encode(decodeSesion)
                defaults.set(encodeSesion, forKey: "logIn")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
