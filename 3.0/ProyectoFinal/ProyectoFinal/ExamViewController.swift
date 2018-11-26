//
//  ExamViewController.swift
//  ProyectoFinal
//
//  Created by Ernesto Pang on 11/4/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class ExamViewController: UIViewController {

    struct question {
        var content: String
        var resp: String
    }
    var list = [question]()
    var i = 0
    
    @IBOutlet weak var answer: UITextField!
    //@IBOutlet weak var errores: UILabel!
    //@IBOutlet weak var aciertos: UILabel!
    @IBOutlet weak var contentQuestion: UITextView!
    @IBOutlet var aviso: UIView!
    var aciertoss = 0
    var erroress = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.append(question(content: """
            Una aleacion es:
        a)Una sustancia quimica

        b)Un compuesto quimico

        c)Una mezcla heterogenea

        d)Una mezcla homogenea
        @d
        """, resp: "d"))
        list.append(question(content: """
        Es una secuencia ordenada de nucleotidos  en la molecula de ADN  y que contiene la informacion necesaria para la sintesis de proteinas.
            a) Codigo genÈtico

            b) Gen

            c) Alelo dominante

            d) Fenotipo
        @a
        """, resp: "a"))
        list.append(question(content: """
            La teoria atomica moderna se lo debe al autor:
        a)Newton

        b)Pascal

        c)Dalton

        d)Bohrn
        @c
        
        """, resp: "c"))
        list.append(question(content: """
            El atomo es la parte mas pequena de la __________ que conserva las propiedades.
        a)Materia

        b)Energia

        c)Sustancia

        d)Mezcla
        @a
        """, resp: "a"))
        list.append(question(content: """
            La temperatura mide la intensidad de:
        a)Calor

        b)Emision

        c)Absorcion

        d)Luz
        @a
        """, resp: "a"))
        list.append(question(content: """
            La sal de mesa es:
        a)Un elemento quimico

        b)Una mezcla

        c)Una sustancia

        d)Un producto dietetico
        @c
        """, resp: "c"))
        list.append(question(content: """
            Las mezclas se forman cuando:
        a)Los elementos reaccionan para formar compuestos

        b)Se combinan dos o mas sustancias

        c)Las sustancias se combinan con el aire

        d)Se exponen los materiales al ambiente
        @b
        """, resp: "b"))
        list.append(question(content: """
            Un elemento es una sustancia que:
        a)Tiene volumen propio

        b)Se comprime facilmente

        c)No puede descomponerse en otras mas simples por medios quimicos

        d)Que arde en presencia de aire.
        @c
        """, resp: "c"))
        list.append(question(content: """
            En un proceso endotermico
        a)Se pierde el calor

        b)Se emite calor

        c)Se absorbe calor

        d)Ninguna de las anteriores
        @c
        """, resp: "c"))
        list.append(question(content: """
            En un proceso exotermico:
        a)Se emite calor

        b)Se absorbe calor

        c)Se emite y se absorbe calor

        d)El agua se congela
        @a
        """, resp: "a"))
        list.append(question(content: """
            Si 50 es el 100% cuanto es el 90%?

        a) 40

        b) 45

        c) 30

        d) 49
        @b
        """, resp: "b"))
        list.append(question(content: """
            Cuando acabo la segunda guerra mundial?

        a) 1944

        b) 1948

        c) 1924

        d) 1945
        @d
        """, resp: ""))
        contentQuestion.text = list[i].content
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
        if aciertoss + erroress != 9{
            if  let answer2 = answer.text {
                if list[i].resp == answer2{
                    aciertoss += 1
                }else{
                    erroress += 1
                }
            }
            i += 1
            //var i = 1
            contentQuestion.text = list[i].content
            //aciertos.text = "Aciertos \(aciertoss)"
            //errores.text = "Errores \(erroress)"
            animateIn()
        }else{
            animateOut()
            OK()
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
    func OK() {
        
        let alertVC = UIAlertController(title: "Perfect", message: "Haz terminado el examen", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { action in
            
            
        }
        
        
        
        alertVC.addAction(okAction)
        
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

