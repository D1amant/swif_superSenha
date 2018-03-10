//
//  PasswordGenerate.swift
//  SuperSenha
//
//  Created by Luis Fernando Rodrigues  on 09/03/18.
//  Copyright © 2018 Luis Fernando Rodrigues . All rights reserved.
//

import Foundation

class PasswordGenerate {
    var numberOfCaracters: Int = 10
    var numberOfPassword: Int = 1
    var useLatters: Bool!
    var useNubers: Bool!
    var useSpecialCaracters: Bool!
    var useUpperCaracters: Bool!
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvxywz"
    private let specialsCharacters = "!@#$%ˆ&*()_+|}{:?><`''~"
    private let numbers = "0123456789"
    
    init( numberOfCaracters: Int, numberOfPassword: Int ,useLatters: Bool , useNubers: Bool , useSpecialCaracters: Bool, useCapitalCaracters: Bool) {
        
        var numChars = min(numberOfCaracters, 16)
        numChars = max(numChars , 1)
        
        self.numberOfCaracters = numChars
        self.numberOfPassword = numberOfPassword
        self.useLatters = useLatters
        self.useNubers = useNubers
        self.useSpecialCaracters = useSpecialCaracters
        self.useUpperCaracters = useCapitalCaracters
    }
    
    func generate(total : Int) -> [String] {
        passwords.removeAll()
        var universe : String = ""
        
        if useNubers {
            universe += numbers;
        }
        
        if useLatters {
            universe += letters
        }
        
        if useUpperCaracters {
            universe += letters.uppercased()
        }
        
        if useSpecialCaracters {
            universe += specialsCharacters
        }
        if !universe.isEmpty{
            let universeArray = Array(universe);
            
            while passwords.count < total {
                var  password = ""
                for _ in 1...numberOfCaracters{
                    let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                    password += String(universeArray[index])
                }
                passwords.append(password)
            }
        }
    
        return passwords
    }
}
