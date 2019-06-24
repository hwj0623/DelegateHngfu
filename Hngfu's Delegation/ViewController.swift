//
//  ViewController.swift
//  Hngfu's Delegation
//
//  Created by 조재흥 on 19. 6. 22..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var unoTextField: UITextField!       // TestField입장에서 delegate는 한번에 1개만 올 수 있다. 
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet weak var treTextField: UITextField!
    @IBOutlet weak var quattroTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unoTextField.delegate = self
        quattroTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.title = textField.text
    }
}
