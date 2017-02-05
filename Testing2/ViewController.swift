//
//  ViewController.swift
//  Ios math game made in swift
//
//  Created by Hadi Deknache on 2016-12-17.
//  Copyright © 2016 Hadi Deknache. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var lbl: UILabel!
    @IBOutlet var res: UILabel!
    
    @IBOutlet var lvl: UILabel!
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var exit: UIButton!
    @IBOutlet var start: UIButton!
    
    @IBOutlet var add: UISwitch!
    
    @IBOutlet var sub: UISwitch!
    
    @IBOutlet var mult: UISwitch!
    
    @IBOutlet var sign: UILabel!
    var player: AVAudioPlayer?
    var timer = Timer()
    var numb:[Int] = [0,0,0]
    var correct:Int = 0
    var result:Int = 0
    var counter:Int = 0
    var win:String = ""
    var level:Int = 1
    
    var dice1:Int = 0
    var dice2:Int = 0
    var dice3:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btn1.layer.cornerRadius=6
        btn2.layer.cornerRadius=6
        btn3.layer.cornerRadius=6
        lbl.layer.cornerRadius=6
        res.layer.cornerRadius=6
        start.layer.cornerRadius=6
        
        start.layer.borderWidth = 2
        start.layer.borderColor = UIColor.black.cgColor
        btn1.layer.borderWidth = 2
        btn1.layer.borderColor = UIColor.black.cgColor
        btn2.layer.borderWidth = 2
        btn2.layer.borderColor = UIColor.black.cgColor
        btn3.layer.borderWidth = 2
        btn3.layer.borderColor = UIColor.black.cgColor
        lbl.layer.borderWidth = 2
        lbl.layer.borderColor = UIColor.black.cgColor
        res.layer.borderWidth = 2
        res.layer.borderColor = UIColor.black.cgColor
        
        btn1.isEnabled=false
        btn2.isEnabled=false
        btn3.isEnabled=false
        btn1.isHidden=true
        btn2.isHidden=true
        btn3.isHidden=true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return UIInterfaceOrientationMask.portrait }
    
    func settxt(){
        if add.isOn {
            adds()
        }
        else if mult.isOn{
            multp()
        }
        else if sub.isOn{
            subtr()
        }
    }
    func check(a:Int,res:Int){
        if a == correct
        {
            self.result = self.result + 1
        }
        else
        {
            self.result = self.result - 1
        }
        self.res.text = "Result: " + String(result)
    }
    
    
    @IBAction func btn1(_ sender: Any) {
        
        if add.isOn {
            check(a: numb[0]+numb[1] , res:correct)
        }
        else if mult.isOn{
            check(a: numb[0]*numb[1] , res:correct)
        }
        else if sub.isOn{
            if correct > 0 {
                check(a: numb[1]-numb[0] , res:correct)
            }
            else{
                check(a: numb[0]-numb[1] , res:correct)
            }
        }
        settxt()
    }
    @IBAction func btn2(_ sender: Any) {
        if add.isOn {
            check(a: numb[2]+numb[0] , res:correct)
        }
        else if mult.isOn{
            check(a: numb[2]*numb[0] , res:correct)
        }
        else if sub.isOn{
            if correct > 0 {
                check(a: numb[2]-numb[0] , res:correct)
            }
            else{
                check(a: numb[0]-numb[2] , res:correct)
            }
        }
        
        settxt()
    }
    @IBAction func btn3(_ sender: Any) {
        if add.isOn {
            check(a: numb[2]+numb[1] , res:correct)
        }
        else if mult.isOn{
            check(a: numb[2]*numb[1] , res:correct)
        }
        else if sub.isOn{
            if correct > 0 {
                check(a: numb[2]-numb[1] , res:correct)
            }
            else{
                check(a: numb[1]-numb[2] , res:correct)
            }
            
        }
        settxt()
    }
    
    func timerAction() {
        counter += 1
        if counter>80{
            timer.invalidate()
            showMsg()
        }
    }
    
    func showMsg(){
        if result >= 15
        {
            self.win = "You made it, you're smart!"
        }
        else if result<15
        {
            self.win = "You didn't make it, better luck next time"
        }
        // create the alert
        let alert = UIAlertController(title: win, message: "Try Again?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "No thanks", style: UIAlertActionStyle.default, handler: { action in
            self.timer.invalidate()
            self.result=0;
            self.lbl.text = nil
            self.res.text = nil
            self.counter = 0
            self.start.isHidden = false
            self.start.isEnabled = true
            self.btn1.isEnabled=false
            self.btn2.isEnabled=false
            self.btn3.isEnabled=false
            self.btn1.isHidden=true
            self.btn2.isHidden=true
            self.btn3.isHidden=true
            self.lvl.isHidden=false
            self.slider.isHidden = false
            self.add.isHidden=false
            self.mult.isHidden=false
            self.sub.isHidden=false
            self.sign.isHidden=false
            self.dismiss(animated: true, completion: nil);
            
        }))
        
        alert.addAction(UIAlertAction(title: "Yes, I Want To Try Again", style: UIAlertActionStyle.destructive, handler: { action in
            
            //self.timer.invalidate()
            self.timer.invalidate()
            self.result = 0;
            self.res.text = nil
            self.lbl.text = nil
            self.counter = 0
            self.lbl.text = nil
            self.start.isHidden = false
            self.start.isEnabled = true
            self.btn1.isEnabled=false
            self.btn2.isEnabled=false
            self.btn3.isEnabled=false
            self.btn1.isHidden=true
            self.btn2.isHidden=true
            self.btn3.isHidden=true
            self.lvl.isHidden=false
            self.slider.isHidden = false
            self.add.isHidden=false
            self.mult.isHidden=false
            self.sub.isHidden=false
            self.sign.isHidden=false
            
        }))
        
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func start(_ sender: Any){
        btn1.isEnabled=true
        btn2.isEnabled=true
        btn3.isEnabled=true
        btn1.isHidden=false
        btn2.isHidden=false
        btn3.isHidden=false
        start.isEnabled=false
        start.isHidden = true
        lvl.isHidden=true
        slider.isHidden=true
        add.isHidden=true
        mult.isHidden=true
        sub.isHidden=true
        sign.isHidden=true
        playSound()
        result=0
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        settxt()
    }
    @IBAction func exit(_ sender: Any) {
        self.timer.invalidate()
        self.result=0;
        self.lbl.text = nil
        self.counter = 0
        self.start.isHidden = false
        self.start.isEnabled = true
        self.btn1.isEnabled=false
        self.btn2.isEnabled=false
        self.btn3.isEnabled=false
        self.btn1.isHidden=true
        self.btn2.isHidden=true
        self.btn3.isHidden=true
        
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func slider(_ sender: Any) {
        let currentValue = Int(slider.value)
        
        if(currentValue==1){
            lvl.text = "Beginner"
            level = 1
        }
        else if(currentValue==2){
            lvl.text = "Intermediate"
            level = 2
        }
        else{
            lvl.text = "Advanced"
            level = 3
        }
    }
    
    @IBAction func add(_ sender: Any) {
        add.setOn(true, animated: true)
        mult.setOn(false, animated: true)
        sub.setOn(false, animated: true)
        
    }
    
    @IBAction func sub(_ sender: Any) {
        add.setOn(false, animated: true)
        sub.setOn(true, animated: true)
        mult.setOn(false, animated: true)
        
    }
    
    @IBAction func multi(_ sender: Any) {
        add.setOn(false, animated: true)
        sub.setOn(false, animated: true)
        mult.setOn(true, animated: true)
    }
    func adds(){
        if level == 1{
            dice1 = Int(arc4random_uniform(80) + 1)
            dice2 = Int(arc4random_uniform(80) + 1)
            dice3 = Int(arc4random_uniform(80) + 1)
        }
        else if level == 2{
            dice1 = Int(arc4random_uniform(500) + 100)
            dice2 = Int(arc4random_uniform(500) + 100)
            dice3 = Int(arc4random_uniform(500) + 100)
        }
        else if level == 3{
            dice1 = Int(arc4random_uniform(1000) + 400)
            dice2 = Int(arc4random_uniform(1000) + 400)
            dice3 = Int(arc4random_uniform(1000) + 400)
        }
        
        correct = Int(dice1+dice2)
        self.numb[0]=dice1
        self.numb[1]=dice2
        self.numb[2]=dice3
        self.numb.sort()
        
        self.lbl.text = String(dice1) + "+" + String(dice2)
        
        self.btn1.setTitle(String(numb[0]+numb[1]), for: .normal)
        
        self.btn2.setTitle(String(numb[2]+numb[0]), for: .normal)
        
        self.btn3.setTitle(String(numb[2]+numb[1]), for: .normal)
    }
    func multp(){
        if level == 1{
            
            dice1 = Int(arc4random_uniform(10) + 1)
            dice2 = Int(arc4random_uniform(10) + 1)
            dice3 = Int(arc4random_uniform(10) + 1)
        
            
        }
        else if level == 2{
            dice1 = Int(arc4random_uniform(20) + 5)
            dice2 = Int(arc4random_uniform(20) + 5)
            dice3 = Int(arc4random_uniform(20) + 5)
        }
        else if level == 3{
            dice1 = Int(arc4random_uniform(40) + 12)
            dice2 = Int(arc4random_uniform(40) + 12)
            dice3 = Int(arc4random_uniform(40) + 12)
        }
        
        correct = Int(dice1*dice2)
        self.numb[0]=dice1
        self.numb[1]=dice2
        self.numb[2]=dice3
        self.numb.sort()
        
        self.lbl.text = String(dice1) + "x" + String(dice2)
        
        self.btn1.setTitle(String(numb[0]*numb[1]), for: .normal)
        
        self.btn2.setTitle(String(numb[2]*numb[0]), for: .normal)
        
        self.btn3.setTitle(String(numb[2]*numb[1]), for: .normal)
    }
    func subtr(){
        if level == 1{
            dice1 = Int(arc4random_uniform(80) + 1)
            dice2 = Int(arc4random_uniform(80) + 1)
            dice3 = Int(arc4random_uniform(80) + 1)
        }
        else if level == 2{
            dice1 = Int(arc4random_uniform(500) + 100)
            dice2 = Int(arc4random_uniform(500) + 100)
            dice3 = Int(arc4random_uniform(500) + 100)
        }
        else if level == 3{
            dice1 = Int(arc4random_uniform(1000) + 400)
            dice2 = Int(arc4random_uniform(1000) + 400)
            dice3 = Int(arc4random_uniform(1000) + 400)
        }
        
        correct = Int(dice2-dice1)
        
        print("Correct: "+String(correct))

        self.numb[0]=dice1
        self.numb[1]=dice2
        self.numb[2]=dice3
        self.numb.sort()
        print("d0: "+String(numb[0]))
        print("d1: "+String(numb[1]))
        print("d2: "+String(numb[2]))
        
        self.lbl.text = String(dice2) + "-" + String(dice1)
        
        if correct > 0 {
            self.btn1.setTitle(String(numb[1]-numb[0]), for: .normal)
            
            self.btn2.setTitle(String(numb[2]-numb[0]), for: .normal)
            
            self.btn3.setTitle(String(numb[2]-numb[1]), for: .normal)
        }
        else{
            self.btn1.setTitle(String(numb[0]-numb[1]), for: .normal)
            
            self.btn2.setTitle(String(numb[0]-numb[2]), for: .normal)
            
            self.btn3.setTitle(String(numb[1]-numb[2]), for: .normal)
        }
        
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
   
}

