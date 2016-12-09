//
//  ViewController.swift
//  sample
//
//  Created by 7006427923 on 2016/12/03.
//  Copyright © 2016年 7006427923. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer!
var flag = 0
    override func viewDidLoad() {
        super.viewDidLoad()

     let path = Bundle.main.path(forResource: "cursor1", ofType: "mp3")!
     var audioError:NSError?
     do {
     audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
     } catch let error as NSError {
     audioError = error
     audioPlayer = nil
     }
     if let error = audioError {
     print("Error \(error.localizedDescription)")
     }
     
     audioPlayer.delegate = self
     audioPlayer.prepareToPlay()
     

     }
     
        // Do any additional setup after loading the view, typically from a nib.
       
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var timer:Timer?
    
    //一定タイミングで繰り返し呼び出される関数
    func TemporalEvent( array: inout [Int], _: UILabel){
        //処理を記述
        print(array)

        for num in array {
            print(num)
            if(num==1){
                label.text="1"
                
                print(label)
                audioPlayer.play()
                
                /*
                if ( audioPlayer.isPlaying ){
                    audioPlayer.stop()
                        audioPlayer.prepareToPlay()
                    audioPlayer.play()
                }
                else{
                    audioPlayer.play()
                    audioPlayer.prepareToPlay()
                    
                }
 */
                sleep(1)
            }else{
                label.text="2"
                audioPlayer.stop()
                //super.viewDidLoad()
               sleep(1)
            }
            
        }
    }
    func startTimer(){
        if timer == nil {
            // 0.3s 毎にTemporalEventを呼び出す
           // timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector:#selector(ViewController.TemporalEvent), userInfo: nil,repeats: true)
        TemporalEvent(array: &data, label)
        }
    }
    
 
    
    func stopTimer(){
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
  
    
    var data:[Int] = []
    @IBOutlet weak var label: UILabel!
    @IBAction func button(_ sender: AnyObject) {
        label.text="clicked"
        data += [1]
    }
    @IBAction func button2(_ sender: AnyObject) {
        label.text = "button2"
        data += [2]
     
        //label.text="2"
    }
   
    @IBAction func start(_ sender: AnyObject) {
        if(flag==0){
        flag=1
        }
        else{
            flag=0
        }
        startTimer()
}
}
