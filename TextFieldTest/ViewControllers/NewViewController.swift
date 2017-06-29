//
//  NewViewController.swift
//  TextFieldTest
//
//  Created by Andrew Seregin on 6/21/17.
//  Copyright © 2017 Andrew Seregin. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var wraper: UIKitWrapper?
    
    @IBOutlet weak var secondTextView: UITextView!
    var secondWraper: UIKitWrapper?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rule = AnyRule { $0 == "Andrew" }
        
        wraper = UIKitWrapper(element: textView,
                              validation: { self.textView.validate(using: rule) },
                              validationHandler: { print($0) })
        wraper?.validateOnChange(enabled: true)
        
        
        let ruleTwo = AnyRule { $0 == "A" }
        secondWraper = UIKitWrapper(element: secondTextView,
                                    validation: { self.secondTextView.validate(using: ruleTwo) },
                                    validationHandler: { print($0) })
        secondWraper?.validateOnChange(enabled: true)
    }
}


struct Container<T: ValidationValue> {
    
    let min: T
    let max: T
    
}