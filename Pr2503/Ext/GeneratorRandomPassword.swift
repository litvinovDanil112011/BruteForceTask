//
//  GeneratorRandomPassword.swift
//  Pr2503
//
//  Created by Daniil Litvinov on 24.07.2022.
//

import UIKit

extension ViewController {
    
    func greteRandomPassword() {
        
        let numberOfPassword = 3
        let pswdChars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
        
        let rndPswd = String((0..<numberOfPassword).map{ _ in pswdChars[Int(arc4random_uniform(UInt32(pswdChars.count)))]})
        print(rndPswd)
    }
}

