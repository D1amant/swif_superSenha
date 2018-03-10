//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Luis Fernando Rodrigues  on 09/03/18.
//  Copyright © 2018 Luis Fernando Rodrigues . All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var txVewPassword: UITextView!
    var numberOfCaracters: Int = 10
    var numberOfPassword: Int = 1
    var useLatters: Bool!
    var useNubers: Bool!
    var useSpecialCaracters: Bool!
    var useUpperCaracters: Bool!
    var passwordGenerate : PasswordGenerate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title =  "Total de senhas :\(numberOfPassword)"
        passwordGenerate = PasswordGenerate(numberOfCaracters: numberOfCaracters, numberOfPassword: numberOfPassword, useLatters: useLatters, useNubers: useNubers, useSpecialCaracters: useSpecialCaracters, useCapitalCaracters: useUpperCaracters)
        generatePassword()
        
    }

    func generatePassword(){
        txVewPassword.text.append("")
        txVewPassword.scrollRangeToVisible(NSRange(location: 0 , length: 0))
        let passwords = passwordGenerate.generate(total : numberOfPassword)
        
        for password in passwords {
            txVewPassword.text.append(password + "\n\n")
        }
    }
    @IBAction func generate(_ sender: Any) {
        generatePassword()
    }
    

}
