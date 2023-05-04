//
//  ViewController.swift
//  Text To Speech
//
//  Created by Khawaja Abdul Haleem on 18/10/2021.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    
    @IBOutlet weak var textOutlet: UITextView!
    
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    
    @IBOutlet weak var pitchSlider: UISlider!
  
    var synthesizer = AVSpeechSynthesizer()
    var speed : Float = 0.5
    
    var pitch : Float = 1
    
    var speedValue : Float = 0.0
    var valuePitched : Float = 0.0
    var string1 : String!
    
    var string: String!
    var currentRange: NSRange = NSRange(location: 0, length: 0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sliderOutlet.value = speed
        
        pitchSlider.value = 1
        pitchSlider.minimumValue = 0.5
        pitchSlider.maximumValue = 2.0
        
        string = textOutlet.text
        
    //    string = "I am currently developing an iOS app that converts text to speech using AVSynthesizer.What I want to do is that while the synthesizer is speaking, utterance rate can be changed and with a slider and the speed of the speaking changes. I am doing this in the IBAction of the slider: self.utterance = sender.value but the synthesizer doesn't change the speed. Ive been looking for information but I haven't found something yet. What can I do? Thanks in advance."

        
        synthesizer = AVSpeechSynthesizer()
        
        synthesizer.delegate = self
        synthesizer.speak(buildUtterance(for: AVSpeechUtteranceDefaultSpeechRate, with: string))
        synthesizer.speak(buildPitchUtterance(for: pitchSlider.value, with: string))
        
    }

    func buildUtterance(for rate: Float, with str: String) -> AVSpeechUtterance {
            let utterance = AVSpeechUtterance(string: str)
            utterance.rate = rate
          //  utterance.pitchMultiplier = pitch
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            return utterance
        }
    
    func buildPitchUtterance(for pitch: Float, with str: String) -> AVSpeechUtterance {
            let utterance = AVSpeechUtterance(string: str)
         //   utterance.rate = rate
            utterance.pitchMultiplier = pitch
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            return utterance
        }
    
    //let utterance: AVSpeechUtterance
    @IBAction func startButton(_ sender: UIButton) {
        let utterance = AVSpeechUtterance(string: textOutlet.text)
        utterance.rate = speed
        synthesizer.speak(utterance)
    }
    
    
    @IBAction func stopButtin(_ sender: UIButton) {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
        synthesizer.pauseSpeaking(at: .immediate)
    }
    
    
    @IBAction func resumeButton(_ sender: UIButton) {
        let utterance = AVSpeechUtterance(string: textOutlet.text)
        utterance.rate = speed
        synthesizer.speak(utterance)
        synthesizer.continueSpeaking()
        
    }
    
    func buildMultUtterance(for pitch: Float,for rate : Float, with str: String) -> AVSpeechUtterance {
            let utterance = AVSpeechUtterance(string: str)
            utterance.rate = rate
            utterance.pitchMultiplier = pitch
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            return utterance
        }
    
    
    
    func sliderSpeed(speedVal : Float, str : String) {
        speedValue = speedVal
        string1 = str
        
    }
    func pitchSlider(valPitch : Float) {
        valuePitched = valPitch
    }
    
    func sliderPitch() {
        var valuesp = speedValue
        var valuepit = valuePitched
      //  var str = string1
        
        synthesizer.speak(buildMultUtterance(for: valuepit, for: valuesp, with: string1))
    }
    
    
    
    @IBAction func pitchSliderChanged(_ sender: UISlider) {
        pitch = sender.value
        synthesizer.stopSpeaking(at: .immediate)
        
        if currentRange.length > 0 {
            let startIndex = textOutlet.text.index(string.startIndex, offsetBy: NSMaxRange(currentRange))
            
            let str = textOutlet.text
            let newStr = str![startIndex...]
            
            string = String(newStr)
            pitchSlider(valPitch: pitch)
       //     synthesizer.speak(buildPitchUtterance(for: pitch, with: string))
        }
    }
    
    @IBAction func voiceSpeed(_ sender: UISlider) {
        
        if sender == sliderOutlet {
            speed = sender.value
          //  pitch = pitchSlider.value
            synthesizer.stopSpeaking(at: .immediate)
            
            if currentRange.length > 0 {
                let startIndex = textOutlet.text.index(string.startIndex, offsetBy: NSMaxRange(currentRange))
                
                let str = textOutlet.text
                let newStr = str![startIndex...]
                
                string = String(newStr)
                sliderSpeed(speedVal: speed, str: string)
            //    synthesizer.speak(buildUtterance(for: speed, with: string))
            }
        }
        else if sender == pitchSlider {
//            pitch = sender.value
//            synthesizer.stopSpeaking(at: .immediate)
//
//            if currentRange.length > 0 {
//                let startIndex = textOutlet.text.index(string.startIndex, offsetBy: NSMaxRange(currentRange))
//
//                let str = textOutlet.text
//                let newStr = str![startIndex...]
//
//                string = String(newStr)
//                synthesizer.speak(buildPitchUtterance(for: pitch, with: string))
            }
        }
//        speed = sender.value
//      //  pitch = pitchSlider.value
//        synthesizer.stopSpeaking(at: .immediate)
//
//        if currentRange.length > 0 {
//            let startIndex = textOutlet.text.index(string.startIndex, offsetBy: NSMaxRange(currentRange))
//
//            let str = textOutlet.text
//            let newStr = str![startIndex...]
//
//            string = String(newStr)
//            synthesizer.speak(buildUtterance(for: speed, with: string))
//        }
        
    }
    


extension ViewController: AVSpeechSynthesizerDelegate {
   
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        debugPrint(Range(characterRange) as Any)
        currentRange = characterRange
    }
}

