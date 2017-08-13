//
//  ViewController.swift
//  SillySong
//
//  Created by VERDU SANJAY on 13/08/17.
//  Copyright © 2017 VERDU SANJAY. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var lyricsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        
        lyricsTextView.text = ""
        inputTextField.text = ""
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        inputTextField.resignFirstResponder()
        
        return false
        
        
    }
    
    
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        
        let bananaFanaTemplate = [
            "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
            "Banana Fana Fo F<SHORT_NAME>",
            "Me My Mo M<SHORT_NAME>",
            "<FULL_NAME>"].joined(separator: "\n")
        
        lyricsTextView.text =  lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: inputTextField.text!)
        
    }
    
    

}



func shortNameFromName( name : String) -> String {
    
    var name = name.lowercased()
    
    let vowelString = "aeiou"
    
    var count = 0
    
    for char in name.characters{
        
        if(vowelString.contains(String(char))){
        
        count = count + 1
        
        }
    }
    
    if(count == 0){
    return name
    
    }
    
    
    while(!vowelString.contains(String(name[name.startIndex]))){
        
        name.remove(at: name.startIndex)
        
        if(name.characters.count == 0){
        break
        }
        
    }
    
    
    return name
}


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
    
    
    
    
