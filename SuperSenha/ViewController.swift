//
//  ViewController.swift
//  SuperSenha
//
//  Created by Luis Fernando Rodrigues  on 07/03/18.
//  Copyright © 2018 Luis Fernando Rodrigues . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNumberPassword: UITextField!
    @IBOutlet weak var tfNumberOfCaracters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNubers: UISwitch!
    @IBOutlet weak var swUpperLatters: UISwitch!
    @IBOutlet weak var swEspecialCaracters: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var swLadtters: UISwitch!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwodsViewController = segue.destination as! PasswordViewController
        
        if let numberOdPasswors = Int(tfNumberPassword.text!){
            passwodsViewController.numberOfPassword = numberOdPasswors
        }
        
        if let numberOfCaracters = Int(tfNumberOfCaracters.text!){
            passwodsViewController.numberOfCaracters = numberOfCaracters
        }
        
        passwodsViewController.useLatters = swLetters.isOn
        passwodsViewController.useNubers = swNubers.isOn
        passwodsViewController.useUpperCaracters = swUpperLatters.isOn
        passwodsViewController.useSpecialCaracters = swEspecialCaracters.isOn
        view.endEditing(true)
        
    }
}

