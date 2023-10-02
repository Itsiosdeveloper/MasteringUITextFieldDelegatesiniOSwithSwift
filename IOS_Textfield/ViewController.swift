//
//  ViewController.swift
//  IOS_Textfield
//
//  Created by IOSDEV on 02/10/23.
// Mastering UITextField Delegates in iOS with Swift | Complete Guide

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a UITextField
        let textField = UITextField(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text"
        textField.delegate = self // Set delegate
        textField.clearButtonMode = .whileEditing // Set clear button behavior
        
        // Add the UITextField to the view
        view.addSubview(textField)
    }

    // MARK: - UITextFieldDelegate Methods
    
    // MARK: Editing Lifecycle
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Should begin editing")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin editing")
        
        // Add animation when text field begins editing
        UIView.animate(withDuration: 0.3) {
            textField.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Should end editing")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Did end editing")
        
        // Reset to original size when editing ends
        UIView.animate(withDuration: 0.3) {
            textField.transform = CGAffineTransform.identity
        }
    }
    
    // MARK: Text Changes
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let range = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: range, with: string)
            print("Text changed: \(updatedText)")
        }
        return true
    }

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            print("Clearing text: \(textField.text ?? "")")
            return true // Return true to clear the text
        } else {
            print("Text not cleared.")
            return false // Return false to prevent clearing
        }
    }
    
    // MARK: Return Key
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


