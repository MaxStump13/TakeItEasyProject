//
//  NoteContent.swift
//  TakeItEasy
//
//  Created by Jacob on 6/9/22.
//

import UIKit
import Speech

class NoteContent: UIViewController {

    var header = ""
    var body = ""
    var hold = ""
    
    let audioEngine = AVAudioEngine()
    let speechRecog = SFSpeechRecognizer()
    let bufferRecogReq = SFSpeechAudioBufferRecognitionRequest()
    var recogTask: SFSpeechRecognitionTask!
    
    var isStart = false
    var isActive = false
    
    @IBOutlet weak var microphone: UIButton!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var content: UITextView!
    
    @IBAction func mic(_ sender: Any) {
        if isActive == false{
            body = content.text
            isActive = true
            microphone.tintColor = UIColor.red
            startSpeechRecog()
        }
        else{
            isActive = false
            microphone.tintColor = UIColor.blue
            stopSpeechRecog()
            body = content.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        microphone.tintColor = UIColor.blue
        name.text = header
        content.text = body
    }
    override func viewDidDisappear(_ animated: Bool) {
        DbHandler.dbHandler.updateNote(orig: header, title: name.text!, body: content.text!)
    }
    
    func startSpeechRecog(){
        let inputN = audioEngine.inputNode
        let recordF = inputN.outputFormat(forBus: 0)
        inputN.installTap(onBus: 0, bufferSize: 2048, format: recordF){
            buffer, _ in self.bufferRecogReq.append(buffer)
        }
        audioEngine.prepare()
        do{
            try audioEngine.start()
        }
        catch{
            print("error")
        }
        recogTask = speechRecog?.recognitionTask(with: bufferRecogReq, resultHandler: {resp, error in
            guard let res = resp else{
                print(error)
                return
            }
            
            let msg = resp?.bestTranscription.formattedString
            self.content.text = self.body + msg!
        })
    }
    func stopSpeechRecog(){
        audioEngine.stop()
        recogTask.finish()
        recogTask.cancel()
        recogTask = nil
    }
}
