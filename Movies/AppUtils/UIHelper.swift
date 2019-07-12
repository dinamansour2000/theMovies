//
//  UIHelper.swift


import Foundation
import UIKit
import Cartography
import SwiftMessages

public class UIHelper: NSObject {
    
    
    public static func showSuccessMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: Utils.localizedString(forKey: "successTitle"), body: message)
        
        let config = UIHelper.getShowMessageConfig()
        SwiftMessages.show(config: config, view: view)
    }
    
    public static func showErrorMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: Utils.localizedString(forKey: "errorTitle"), body: message)
        let config = UIHelper.getShowMessageConfig()
        SwiftMessages.show(config: config, view: view)
    }
    
    private static func getShowMessageConfig() -> SwiftMessages.Config{
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        config.dimMode = .gray(interactive: true)
        config.interactiveHide = true
        return config
    }
    
    public static func addBottomBorder(_ field: UITextField, string : String)-> UITextField{
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: field.frame.size.height - width, width:  field.frame.size.width + 50 , height: field.frame.size.height)
        
        field.textColor = UIColor.white
        field.backgroundColor = UIColor.clear
        border.borderWidth = width
        field.layer.addSublayer(border)
        field.layer.masksToBounds = true
        field.attributedPlaceholder = NSAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return field
    }
    
    public static func addRedBottomBorder(_ field: UITextField, string : String)-> UITextField{
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.red.cgColor
        border.frame = CGRect(x: 0, y: field.frame.size.height - width, width:  field.frame.size.width + 50 , height: field.frame.size.height)
        
        field.textColor = UIColor.white
        field.backgroundColor = UIColor.clear
        border.borderWidth = width
        field.layer.addSublayer(border)
        field.layer.masksToBounds = true
        field.attributedPlaceholder = NSAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return field
    }
    
    public static func addGreyBottomBorder(_ field: UITextField, string : String)-> UITextField{
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: field.frame.size.height - width, width:  field.frame.size.width + 50 , height: field.frame.size.height)
        
        field.textColor = UIColor.darkGray
        field.backgroundColor = UIColor.clear
        border.borderWidth = width
        field.layer.addSublayer(border)
        field.layer.masksToBounds = true
        field.attributedPlaceholder = NSAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        return field
    }
    
    public static func addGreyRedBottomBorder(_ field: UITextField, string : String)-> UITextField{
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.red.cgColor
        border.frame = CGRect(x: 0, y: field.frame.size.height - width, width:  field.frame.size.width + 50 , height: field.frame.size.height)
        
        field.textColor = UIColor.darkGray
        field.backgroundColor = UIColor.clear
        border.borderWidth = width
        field.layer.addSublayer(border)
        field.layer.masksToBounds = true
        field.attributedPlaceholder = NSAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        return field
    }
    
    public static func addGreyWhiteBorder(_ field: UIView)-> UIView{
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: field.frame.size.height, width:  field.frame.size.width  , height: field.frame.size.height)
        
        
        
        let border2 = CALayer()
        
        border2.borderColor = UIColor.white.cgColor
        border2.frame = CGRect(x: field.frame.size.width , y: field.frame.size.height, width:  field.frame.size.width  , height: field.frame.size.height)
        
        border2.borderWidth = width
        
        let border3 = CALayer()
        
        border3.borderColor = UIColor.white.cgColor
        border3.frame = CGRect(x: 0, y: 0, width: field.frame.size.width  , height: field.frame.size.height)
        
        border3.borderWidth = width
        
        let border4 = CALayer()
        
        border4.borderColor = UIColor.white.cgColor
        border4.frame = CGRect(x: 0, y: field.frame.size.height, width: field.frame.size.width  , height: field.frame.size.height)
        
        border4.borderWidth = width
        
        
        field.layer.addSublayer(border)
        field.layer.addSublayer(border2)
        field.layer.addSublayer(border3)
        field.layer.addSublayer(border4)
        field.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.13)
        
        field.layer.masksToBounds = true
        
        return field
    }
    
    public static func addWhiteBorder(_ field: UIView)-> UIView{
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: field.frame.size.height, width:  field.frame.size.width  , height: field.frame.size.height)
        
     
        
        let border2 = CALayer()
        
        border2.borderColor = UIColor.white.cgColor
        border2.frame = CGRect(x: field.frame.size.width , y: field.frame.size.height, width:  field.frame.size.width  , height: field.frame.size.height)
        
        border2.borderWidth = width
        
        let border3 = CALayer()
        
        border3.borderColor = UIColor.white.cgColor
        border3.frame = CGRect(x: 0, y: 0, width: field.frame.size.width  , height: field.frame.size.height)
        
        border3.borderWidth = width
        
        let border4 = CALayer()
        
        border4.borderColor = UIColor.white.cgColor
        border4.frame = CGRect(x: 0, y: field.frame.size.height, width: field.frame.size.width  , height: field.frame.size.height)
        
        border4.borderWidth = width
        
        
        field.layer.addSublayer(border)
         field.layer.addSublayer(border2)
         field.layer.addSublayer(border3)
         field.layer.addSublayer(border4)
        field.backgroundColor = UIColor.clear

        field.layer.masksToBounds = true
        
        return field
    }
    
    public static func correctViewSize(_ field: UIScrollView)-> UIScrollView{
        
        var viewHeight =  field.frame.size.height;
        var viewWidth =  field.frame.size.width;
        
        if Utils.isIPhone4(){
            viewHeight = 480;
            viewWidth = 320;
            field.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        }else if Utils.isIPhone5(){
            viewHeight = 568;
            viewWidth = 320;
            field.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if Utils.isIPhone6(){
            viewHeight = 667;
            viewWidth = 375;
            field.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if Utils.isIPhone6Plus(){
            viewHeight = 736;
            viewWidth = 414;
            field.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if Utils.isIPhoneX(){
            viewHeight = 812;
            viewWidth = 375;
            field.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if Utils.isIPhoneXR(){
            viewHeight = 896;
            viewWidth = 414;
            field.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if Utils.isIPhoneXSMax(){
            viewHeight = 896;
            viewWidth = 414;
            field.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        field.frame = CGRect(x: field.frame.origin.x, y: field.frame.origin.y, width: viewWidth, height: viewHeight)
        
        return field
    }
    
    public static func correctSegmentViewSize(_ field: UIView)-> UIView{
        
        var viewHeight =  field.frame.size.height;
        var viewWidth =  field.frame.size.width;
        
        if Utils.isIPhone4(){
            viewHeight = 255;
            viewWidth = 320;
            
        }else if Utils.isIPhone5(){
            viewHeight = 443;
            viewWidth = 320;
        }else if Utils.isIPhone6(){
            viewHeight = 542;
            viewWidth = 375;
        }else if Utils.isIPhone6Plus(){
            viewHeight = 611;
            viewWidth = 414;
        }else if Utils.isIPhoneX(){
            viewHeight = 687;
            viewWidth = 375;
        }else if Utils.isIPhoneXR(){
            viewHeight = 771;
            viewWidth = 414;
        }else if Utils.isIPhoneXSMax(){
            viewHeight = 771;
            viewWidth = 414;
        }
        
        field.frame = CGRect(x: field.frame.origin.x, y: field.frame.origin.y, width: viewWidth, height: viewHeight)
        
        return field
    }
    public static func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    public static func stringToUTF16String (stringaDaConvertire stringa: String) -> String {
        
        let encodedData = stringa.data(using: String.Encoding.utf16)!
        
        do {
            return try NSAttributedString(data: encodedData,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil).string
        } catch {
            print("error: ", error)
            return ""
        }
    }
}

