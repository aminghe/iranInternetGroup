//
//  Toast.swift
//  Amin.Gheynarloo
//
//  Created by amin on 3/13/1396 AP.
//  Copyright © 1396 vip. All rights reserved.
//

import UIKit

enum typeMessage {
    case success
    case warning
    case error
    case info
    
}

class Message : UIView {
    
    // success
    private var _backgroundColor : UIColor = UIColor(rgb: 0xDFF2BF)
    
    private var _nibName : String = "View"
    private var showKeyboard : Bool = false
    var _timer : Timer?
    @IBOutlet weak var lblMessage: labelFont!
    
    
    private static var sharedMessage: Message = {
        
        var message = Message()
        // Configuration
        message = UINib(nibName: "View", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! Message
        
        
        return message
    }()
    
    
    class func show(message : String, type : typeMessage = typeMessage.success, time : Int = 3) {

        var _backgroundColor : UIColor?
        var _color : UIColor?
        
        if(type == .success)
        {
            _backgroundColor = UIColor(rgb: 0xDFF2BF)
            _color = UIColor(rgb : 0x4F8A10)
            
        }else if(type == .warning){
            
            _backgroundColor = UIColor(rgb: 0xFEEFB3)
            _color = UIColor(rgb : 0x9F6000)
            
        }else if(type == .error){
            
            _backgroundColor = UIColor(rgb: 0xFFBABA)
            _color = UIColor(rgb : 0xD8000C)
            
        }else if(type == .info){
            
            _backgroundColor = UIColor(rgb: 0xBDE5F8)
            _color = UIColor(rgb : 0x00529B)
            
        }
        
        sharedMessage.lblMessage.backgroundColor = _backgroundColor
        sharedMessage.lblMessage.textColor = _color
        sharedMessage.lblMessage.layer.masksToBounds = true
        sharedMessage.lblMessage.layer.cornerRadius = 5
        
        sharedMessage.lblMessage.text = message
        sharedMessage._timer?.invalidate()
        sharedMessage.startTimer(time: time)
        sharedMessage.showAnimate()
        
    }

    class func stop(){
        sharedMessage.removeAnimate()
    }
    
    override func awakeFromNib() {

        let screenSize: CGRect = UIScreen.main.bounds
        frame = CGRect(origin: CGPoint(x: 0,y :screenSize.height - (frame.height + 20)), size: CGSize(width: screenSize.width, height: frame.height))
        layer.zPosition = CGFloat(MAXFLOAT)
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        _timer?.invalidate()
        removeAnimate()
    }
    
    func startTimer(time : Int){
        _timer = Timer.scheduledTimer(timeInterval: TimeInterval(time), target: self, selector: #selector(self.removeAnimate), userInfo: nil, repeats: true);
    }

    func showAnimate(){
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 1.0
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        print(showKeyboard)
        if(showKeyboard == false){
            UIApplication.shared.keyWindow?.addSubview(self)
        }else{
            let windowCount = UIApplication.shared.windows.count
            UIApplication.shared.windows[windowCount-1].addSubview(self)
        }
        
    }
    
    func keyboardWillShow(notification: NSNotification){
        
        if notification.name == Notification.Name.UIKeyboardWillShow {
            self.showKeyboard = true
        }else{
            self.showKeyboard = false
        }
        
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished){
                self.removeFromSuperview()
            }
        })
    }
    
    
}






