


import UIKit
import SystemConfiguration

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}

extension String{
    static func noInternet()->String{
        return "Please chcek your internet connection"
    }
    static func unknownError()->String{
        return "An unknown error occurred, try again"
    }
    enum UserDetails {
        case userId
        case userImage
        case email
        case fname
        case lname
        case usertype
        case lattitude
        case longitude
        case usertoken
        case userName
        case vPassword
        case vPhone
        case eGender
        case dDob
        case vCity
        case vCountry
        case vState
        case iCityId
        case iCountryId
        case iStateId
        case vLoginToken
        case vImage
        case vThumbnail
        case eHistory
        case bankstatus
    }
    static func getUserDetails(type:UserDetails)->String?{
        
        if let heroObject = UserDefaults.standard.value(forKey: "LoginDict") as? NSData {
            if let ud = NSKeyedUnarchiver.unarchiveObject(with: heroObject as Data) as? [String:AnyObject]{
                
                if type == .userId{
                    if let value = ud["iUserId"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                if type == .userImage{
                    if let value = ud["vImage"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                if type == .email{
                    if let value = ud["vEmail"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                if type == .fname{
                    if let value = ud["vFirstName"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                if type == .lname{
                    if let value = ud["vLastName"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                if type == .usertype{
                    if let value = ud["vType"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .lattitude{
                    if let value = ud["vLat"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .longitude{
                    if let value = ud["vLong"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .vPassword{
                    if let value = ud["vPassword"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .usertoken{
                    if let value = ud["vLoginToken"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                
                if type == .userName{
                    if let value = ud["vFirstName"], let value1 = ud["vLastName"]{
                        return String(describing: "\(value) \(value1)")
                    }else{
                        return ""
                    }
                }
                
                if type == .vPhone {
                    if let value = ud["vPhone"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .eGender {
                    if let value = ud["eGender"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .dDob {
                    if let value = ud["dDob"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                
                if type == .vCity {
                    if let value = ud["vCity"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .vCountry {
                    if let value = ud["vCountry"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .vState {
                    if let value = ud["vState"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .iCityId {
                    if let value = ud["iCityId"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .iCountryId {
                    if let value = ud["iCountryId"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .iStateId {
                    if let value = ud["iStateId"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }
                
                if type == .vLoginToken {
                    if let value = ud["vLoginToken"]{
                        return String(describing: value)
                    }else{
                        return ""
                    }
                }

                if type == .vImage {
                    if let value = ud["vImage"]{
                        return String(describing: value)
                    }
                }
                
                if type == .vThumbnail {
                    if let value = ud["vThumbnail"]{
                        return String(describing: value)
                    }
                }
                if type == .eHistory {
                    if let value = ud["eHistory"]{
                        return String(describing: value)
                    }
                }
                if type == .bankstatus {
                    if let value = ud["bankstatus"]{
                        return String(describing: value)
                    }else{
                        return "0"
                    }
                }
            }
        }
        return ""
    }
    
    
    func removeWhiteSpaces()->String
    {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    static func getDeiceToken()->String{
        
        if let dt = UserDefaults.standard.object(forKey: "deviceToken") as? String{
            return dt
        }else{
            return "CouldNotGetDeviceToken"
        }
        
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    static func getConvertedDate(dateStr:String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateStr)
        dateFormatter.dateFormat = "dd MMM yyyy h:mm a"
        return  dateFormatter.string(from: date!)
    }
}



class ShowToast: NSObject {
    static var lastToastLabelReference:UILabel?
    static var initialYPos:CGFloat = 0
    class func show(toatMessage:String)
    {
        
        if let app = UIApplication.shared.delegate as? AppDelegate, let keyWindow = app.window
        {
            FVTHud.hide()
            if lastToastLabelReference != nil
            {
                let prevMessage = lastToastLabelReference!.text?.replacingOccurrences(of: " ", with: "").lowercased()
                let currentMessage = toatMessage.replacingOccurrences(of: " ", with: "").lowercased()
                if prevMessage == currentMessage
                {
                    return
                }
            }
            
            let cornerRadious:CGFloat = 12
            let toastContainerView:UIView={
                let view = UIView()
                view.layer.cornerRadius = cornerRadious
                view.translatesAutoresizingMaskIntoConstraints = false
                view.backgroundColor = UIColor .white
                view.alpha = 0.8
                return view
            }()
            let labelForMessage:UILabel={
                let label = UILabel()
                label.layer.cornerRadius = cornerRadious
                label.layer.masksToBounds = true
                label.textAlignment = .center
                label.numberOfLines = 0
                label.adjustsFontSizeToFitWidth = true
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = toatMessage
                label.textColor = .black
                label.backgroundColor = UIColor.init(white: 0, alpha: 0)
                return label
            }()
            
            keyWindow.addSubview(toastContainerView)
            
            let fontType = UIFont.boldSystemFont(ofSize: 12)
            labelForMessage.font = fontType
            
            let sizeOfMessage = NSString(string: toatMessage).boundingRect(with: CGSize(width: keyWindow.frame.width, height: keyWindow.frame.height), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:fontType], context: nil)
            
            let topAnchor = toastContainerView.bottomAnchor.constraint(equalTo: keyWindow.topAnchor, constant: 0)
            keyWindow.addConstraint(topAnchor)
            
            toastContainerView.centerXAnchor.constraint(equalTo: keyWindow.centerXAnchor, constant: 0).isActive = true
            
            var extraHeight:CGFloat = 0
            if (keyWindow.frame.size.width) < (sizeOfMessage.width+20)
            {
                extraHeight = (sizeOfMessage.width+20) - (keyWindow.frame.size.width)
                toastContainerView.leftAnchor.constraint(equalTo: keyWindow.leftAnchor, constant: 5).isActive = true
                toastContainerView.rightAnchor.constraint(equalTo: keyWindow.rightAnchor, constant: -5).isActive = true
            }
            else
            {
                toastContainerView.widthAnchor.constraint(equalToConstant: sizeOfMessage.width+20).isActive = true
            }
            let totolHeight:CGFloat = sizeOfMessage.height+25+extraHeight
            toastContainerView.heightAnchor.constraint(equalToConstant:totolHeight).isActive = true
            toastContainerView.addSubview(labelForMessage)
            lastToastLabelReference = labelForMessage
            labelForMessage.topAnchor.constraint(equalTo: toastContainerView.topAnchor, constant: 0).isActive = true
            labelForMessage.bottomAnchor.constraint(equalTo: toastContainerView.bottomAnchor, constant: 0).isActive = true
            labelForMessage.leftAnchor.constraint(equalTo: toastContainerView.leftAnchor, constant: 5).isActive = true
            labelForMessage.rightAnchor.constraint(equalTo: toastContainerView.rightAnchor, constant: -5).isActive = true
            keyWindow.layoutIfNeeded()
            
            let padding:CGFloat = initialYPos == 0 ? (100) : 10 // starting position
            initialYPos += padding+totolHeight
            topAnchor.constant = initialYPos
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseIn, animations: {
                keyWindow.layoutIfNeeded()
            }, completion: { (bool) in
                
                topAnchor.constant = 0
                UIView.animate(withDuration: 0.4, delay: 3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                    keyWindow.layoutIfNeeded()
                }, completion: { (bool) in
                    if let lastToastShown = lastToastLabelReference,labelForMessage == lastToastShown
                    {
                        lastToastLabelReference = nil
                    }
                    initialYPos -= (padding+totolHeight)
                    toastContainerView.removeFromSuperview()
                })
            })
        }
    }
}

class ShowAlertView{
    class func show(titleMessage:String="Success",desciptionMessage:String="Successfully completed")
    {
        if let app = UIApplication.shared.delegate as? AppDelegate, let keyWindow = app.window,let rootVC = keyWindow.rootViewController
        {
            let alert = UIAlertController.init(title: titleMessage, message: desciptionMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(ok)
            rootVC.present(alert, animated: true, completion: nil)
        }
    }
}

class Reachability {
    
    class func isAvailable() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}



extension UISearchBar {
    public func setSerchTextFont(font: UIFont) {
        let clrChange = subviews.flatMap { $0.subviews }
        guard let sc = (clrChange.filter { $0 is UITextField }).first as? UITextField else { return }
        sc.font = font
    }
}

extension UIView{
    func showMessageLabel(msg:String = "No record(s) found",fonts:UIFont = UIFont(name: "MyriadPro-Bold", size: 24)!,color:UIColor = .gray) {
        let label = UILabel()
        label.text = msg
        label.font = fonts
        label.textColor = color
        label.numberOfLines = 0
        label.tag = 851
        label.textAlignment = .center
        self.addSubview(label)
        if let superView = self.superview{
            superView.layoutIfNeeded()
        }
        label.frame = self.bounds
    }
    
    func removeMessageLabel(){
        for view in self.subviews{
            if view.tag == 851{
                view.removeFromSuperview()
            }
        }
    }
    
    func slideInFromTopView(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil){
        
        let slideInFromLeftTransition = CATransition()
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromBottom
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
    
    func slideInFromLeftView(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil){
        
        let slideInFromLeftTransition = CATransition()
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromRight
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
    
    func slideInFromRightView(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil){
        
        let slideInFromLeftTransition = CATransition()
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromLeft
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
    
    func slideInFromTopViewHidden(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil)  {
        
        let slideInFromLeftTransition = CATransition()
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromBottom
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
        self.layer.isHidden = true
    }
}




