//
//  TestViewController.swift
//  ProyectoFinal
//
//  Created by Ernesto Pang on 11/2/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    struct question {
        var content: String
        var resp: String
        
    }
    var list = [question]()
    
    @IBOutlet weak var contentQuestion: UITextView!
    @IBOutlet var aviso: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.append(question(content: """
        Esta es una pregunta mamalona perrro
        abrazo
        beso
        casco
        dedo
        """, resp: "d"))
        list.append(question(content: """
        Esta es otra pregunta mamalona lalksdjfa;sldkjfa;sldjfa;sdj
        a;lskdjf;alkdjfa;jfa;a;sldkfj
        alskdjfalsdkjf
        """, resp: "b"))
        contentQuestion.text = list[0].content
        animateIn()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateIn() {
        self.view.addSubview(aviso)
        aviso.center = self.view.center
        //self.view.backgroundColor = UIColor.red
        aviso.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        aviso.alpha = 0
        UIView.animate(withDuration: 0.6){
            self.aviso.alpha = 1
            self.aviso.transform = CGAffineTransform.identity
        }
    }
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations:{
            self.aviso.transform = CGAffineTransform.init(scaleX: 1.3 ,y: 1.3 )
            self.aviso.alpha = 0
            //self.efectovisual.effect = nil
        } ){(success: Bool) in
            self.aviso.removeFromSuperview()
        }
    }
    
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        //animateOut()
        animateIn()
        let i = 1
        contentQuestion.text = list[i].content
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

