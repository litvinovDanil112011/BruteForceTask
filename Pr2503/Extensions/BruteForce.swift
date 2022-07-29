//
//  BruteForce.swift
//  Pr2503
//
//  Created by Daniil Litvinov on 14.07.2022.
//

import UIKit

extension ViewController {
            
     func bruteForce(passwordToUnlock: String) {
        let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }

        var passwordBruteForce: String = ""

        while passwordBruteForce != passwordToUnlock { 
            passwordBruteForce = generateBruteForce(passwordBruteForce, fromArray: ALLOWED_CHARACTERS)
            print(passwordBruteForce)
            DispatchQueue.main.async {
                self.label.text = passwordBruteForce
                if self.label.text == self.password {
                    self.activitiIndicator.stopAnimating()
                    self.activitiIndicator.isHidden = true
                    self.label.text = "You password \(self.password)"
                    self.view.backgroundColor = .green
                } else {
                    self.label.text = "\(passwordBruteForce)"
                    self.view.backgroundColor = .red
                }
            }
        }
        print(passwordBruteForce)
    }
}

