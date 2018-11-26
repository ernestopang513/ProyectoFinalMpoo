//
//  SettingsViewController.swift
//  ProyectoFinal
//
//  Created by Ernesto Pang on 11/4/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var nameOfUser: UILabel!
    var settings = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let dato = defaults.object(forKey: "logIn")  {
            let decodeSesion = try? JSONDecoder().decode(Usuarios.self, from: dato as! Data)
            nameOfUser.text = decodeSesion!.nameOfUsuario
            if (decodeSesion?.verificado)! == false{
                let status = "Usuario no verificado"
                
                settings = ["Name of user \((decodeSesion?.nameOfUsuario)! )", "School \(status)", "Score \(status)", "About me \(status)", "\(status)"]
            }else{
                
                settings = ["Name of user \((decodeSesion?.nameOfUsuario)! )", "School \((decodeSesion?.school)!)", "Score \((decodeSesion?.score)!)", "About me \((decodeSesion?.aboutMe)!)", "Usuario Verificado"]
            }
        // Do any additional setup after loading the view.
        }
        
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = String(settings[indexPath.row])
        
        
        return cell
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogOut(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if let dato = defaults.object(forKey: "logIn")  {
            var decodeSesion = try? JSONDecoder().decode(Usuarios.self, from: dato as! Data)
            decodeSesion!.estado = false
            let encodeData = try? JSONEncoder().encode(decodeSesion)
            defaults.set(encodeData, forKey: "logIn")
            
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
