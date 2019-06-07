//
//  Utils.swift


import UIKit
import Localize_Swift
import Kingfisher

class Utils {
    
    
    static let VIEW_SCREEN_WIDTH         = UIScreen.main.nativeBounds.width
    static let VIEW_SCREEN_HEIGHT        = UIScreen.main.nativeBounds.height
    static let VIEW_SCREEN_MAX_LENGTH    = max(VIEW_SCREEN_WIDTH, VIEW_SCREEN_HEIGHT)
    
    static func isIPhone4() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && VIEW_SCREEN_MAX_LENGTH == 960
    }
    
    static func isIPhone5() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && VIEW_SCREEN_MAX_LENGTH == 1136
    }
    static func isIPhone6() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && VIEW_SCREEN_MAX_LENGTH == 1134
    }
    
    static func isIPhone6Plus() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && VIEW_SCREEN_MAX_LENGTH == 2208
    }
    
    static func isIPhoneX() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && VIEW_SCREEN_MAX_LENGTH == 2436
    }
    static func isIPhoneXR() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && VIEW_SCREEN_MAX_LENGTH == 1792
    }
    static func isIPhoneXSMax() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && VIEW_SCREEN_MAX_LENGTH == 2688
    }
    public static func isIPhone() -> Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    public static func isIPad() -> Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }
    
    public static func localizedString(forKey key: String) -> String {
        Localize.setCurrentLanguage("ar")
        let resutl = key.localized(using: "Localization", in: .main)
        return resutl;
    }
}
