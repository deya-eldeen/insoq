//
//  Extensions.swift
//  orood
//
//  Created by Deya AlDeen on 15/07/2021.
//

import UIKit
import MapKit
import Defaults

extension Date {
    
    init(miliSecondsTimeIntervalSince1970: Double ) {
        self.init(timeIntervalSince1970: miliSecondsTimeIntervalSince1970 / 1000)
    }
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        let newDate = Date(timeInterval: seconds, since: self)
        return newDate
    }
    
    var startOfDay: Date {
        let calendar = Calendar.current
        let date = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
        return date.toGlobalTime()
    }
    
    func numberOfDays(to date: Date) -> Int {
        let calendar = Calendar.current
        let d1 = calendar.startOfDay(for: self)
        let d2 = calendar.startOfDay(for: date)
        return (calendar.dateComponents([.day], from: d1, to: d2).day ?? 0)
    }
    
    func timestamp() -> TimeInterval {
        return self.timeIntervalSince1970 * 1000
    }
}

extension Double {
//    func toDate() -> Date {
//        return Date(timeIntervalSince1970: self / 1000.0)
//    }
    
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func roundTo(decimalPlaces: Int) -> String {
        return NSString(format: "%.\(decimalPlaces)f" as NSString, self) as String
    }
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
       dateformat.locale = .init(identifier: "en")
        return dateformat.string(from: self)
    }
}

extension Date {
    func toCurrentTimezone() -> Date {
        let dst = TimeZone.current.daylightSavingTimeOffset()
        let timeZoneDifference = TimeInterval(TimeZone.current.secondsFromGMT()) - dst
        return self.addingTimeInterval(timeZoneDifference)
   }
    
    func toIsoDateString() -> String {
        let formattedDate = self.getFormattedDate(format: "yyyy-MM-ddT00:00:00")
        //1994-04-20T00:00:00
        return "\(formattedDate)"
    }
    
    func toYMDDateString() -> String {
        let formattedDate = self.getFormattedDate(format: "yyyy-MM-dd")
        //1994-04-20T00:00:00
        return "\(formattedDate)"
    }
    
}

extension Int {
    func toDate() -> String {
        let date = Date(timeIntervalSince1970: Double(self)).toCurrentTimezone()
        let formattedDate = date.getFormattedDate(format: "yyyy-MM-dd (h:mm) a")
        return "\(formattedDate)"
    }
    
}

extension UITextView {
    
    private class PlaceholderLabel: UILabel { }
    
    private var placeholderLabel: PlaceholderLabel {
        if let label = subviews.compactMap( { $0 as? PlaceholderLabel }).first {
            return label
        } else {
            let label = PlaceholderLabel(frame: .zero)
            label.font = font
            addSubview(label)
            return label
        }
    }
    
    @IBInspectable
    var placeholder: String {
        get {
            return subviews.compactMap( { $0 as? PlaceholderLabel }).first?.text ?? ""
        }
        set {
            let placeholderLabel = self.placeholderLabel
            placeholderLabel.text = newValue
            placeholderLabel.numberOfLines = 0
            placeholderLabel.textColor = AppColors.theme_darkBlue
            let width = frame.width - textContainer.lineFragmentPadding * 2
            let size = placeholderLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
            placeholderLabel.frame.size.height = size.height
            placeholderLabel.frame.size.width = width
            placeholderLabel.frame.origin = CGPoint(x: textContainer.lineFragmentPadding, y: textContainerInset.top)
            
            textStorage.delegate = self
        }
    }
}

extension UITextView: NSTextStorageDelegate {
    
    public func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorage.EditActions, range editedRange: NSRange, changeInLength delta: Int) {
        if editedMask.contains(.editedCharacters) {
            placeholderLabel.isHidden = !text.isEmpty
        }
    }
}

extension UITableView {
    func setNoDataPlaceholder(_ message: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        label.text = "    \(message)    "
        // styling
        label.sizeToFit()
        label.textColor = UIColor.lightGray
        
        self.tableFooterView = label
    }
    
    func removeNoDataPlaceholder() {
        self.isScrollEnabled = true
        self.backgroundView = nil
        self.tableFooterView = nil
        self.separatorStyle = .singleLine
    }
    
    func setEmptyBackground(message: String!, count: Int) {
        
        if count > 0 {
            backgroundView = nil
            return
        }
        
        if backgroundView == nil {
            let bgView = UIView()
            backgroundView = bgView
            let label = UILabel()
            label.tag = 101
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            backgroundView!.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: bgView.topAnchor),
                label.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: bgView.bottomAnchor)
            ])
        }
        
        guard let label = backgroundView?.viewWithTag(101) as? UILabel else { return }
        label.text = message ?? NSLocalizedString("Empty List", comment: "Default empty message used in all lists if retrieved empty")
    }
    
    func addBottomActivityIndicator(){
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 55))
        activityIndicator.startAnimating()
        activityIndicator.style = .gray
        self.tableFooterView = activityIndicator
    }
    
    func removeBottomActivityIndicator(){
        self.tableFooterView = nil
    }
    
    func indexPathExists(indexPath:IndexPath) -> Bool {
        if indexPath.section >= self.numberOfSections {
            return false
        }
        if indexPath.row >= self.numberOfRows(inSection: indexPath.section) {
            return false
        }
        return true
    }
}

extension UIWindow {
    var topViewController: UIViewController? {
        guard var top = rootViewController else {
            return nil
        }
        while let next = top.presentedViewController {
            top = next
        }
        return top
    }
}

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    public var replaceArabicDigitsWithEnglish: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
}

public extension KeyedDecodingContainer where Key: CodingKey {
    /// Try to decode a Bool as Int then String before decoding as Bool.
    ///
    /// - Parameter key: Key.
    /// - Returns: Decoded Bool value.
    /// - Throws: Decoding error.
    func decodeBoolAsIntOrString(forKey key: K) throws -> Bool {
        if let bool = try? decode(Bool.self, forKey: key) {
            return bool
        }
        if let bool = try? decode(String.self, forKey: key) {
            return bool == "1"
        }
        let int = try decode(Int.self, forKey: key)
        return int == 1
    }
    
    /// Try to decode a Bool as Int then String before decoding as Bool if present.
    ///
    /// - Parameter key: Key.
    /// - Returns: Decoded Bool value.
    /// - Throws: Decoding error.
    func decodeBoolAsIntOrStringIfPresent(forKey key: K) throws -> Bool? {
        if let bool = try? decodeIfPresent(Bool.self, forKey: key) {
            return bool
        }
        if let bool = try? decodeIfPresent(String.self, forKey: key) {
            return bool == "1"
        }
        if let int = try? decodeIfPresent(Int.self, forKey: key) {
            return int == 1
        }
        return nil
    }
}

extension CLLocationCoordinate2D {
    func isValid() -> Bool {
        let lat = self.latitude
        let lon = self.longitude
        let max = 90.0
        let min = -90.0
        
        if(lat > max || lat < min || lon > max || lon < min){
            return false
        }else{
            return true
        }
    }
}

extension Encodable {
    var dict : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
        return json
    }
}

extension UICollectionView {
    func register(id : String){
        self.register(UINib(nibName: id, bundle:nil), forCellWithReuseIdentifier: id)
    }
}

extension UITableView {
    
    func register(id : String){
        self.register(UINib(nibName: id, bundle:nil), forCellReuseIdentifier: id)
    }
    
    func register(ids : [String]){
        for id in ids {
            self.register(UINib(nibName: id, bundle:nil), forCellReuseIdentifier: id)
        }
    }
    
    func prepareTableView(vc: UIViewController, withCellsIDs: [String]){
        for cellID in withCellsIDs {
            self.register(id: cellID)
        }
        self.tableFooterView = UIView()
        self.flashScrollIndicators()
        self.keyboardDismissMode = .onDrag
        self.delegate = vc as? UITableViewDelegate
        self.dataSource = vc as? UITableViewDataSource
    }
    
    
}



extension UIViewController {
    
    func openURL(targetUrl: String) {
        
        guard let url = URL(string: targetUrl) else {
          return
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func openMap(coordinate: CLLocationCoordinate2D, name: String) {
        
        let regionDistance:CLLocationDistance = 5000
        let regionSpan = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: options)
    }
//    func shouldShowLoginForGuests() -> Bool {
//
//        guard (Defaults[.session] == nil) else { return false }
//
//        let title = L10n.signInMessage.localized
//
//        DispatchQueue.main.async {
//            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
//            let cancelAction = UIAlertAction(title: L10n.cancel.localized, style: .destructive, handler: nil)
//            let signInAction = UIAlertAction(title: L10n.signInTitle.localized, style: .default, handler: {_ in
//                AppDelegate().signIn()
//            })
//            alert.addAction(cancelAction)
//            alert.addAction(signInAction)
//            self.getTopMostViewController()?.present(alert, animated: true, completion: nil)
//        }
//
//        return true
//    }
    
    func getTopMostViewController() -> UIViewController? {
        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        return topMostViewController
    }
    
    func showAlert(title:String, body: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            self.getTopMostViewController()?.present(alert, animated: true, completion: nil)
        }
    }
    
//    func showShareSheet(text: String) {
//
//        // set up activity view controller
//        let textToShare = [ text ]
//        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
//
//        // exclude some activity types from the list (optional)
//        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
//
//        // present the view controller
//        self.present(activityViewController, animated: true, completion: nil)
//
//    }
}

//extension Array {
//    mutating func add(_ newElement: Element, at indexes: [Int]) {
//        for index in indexes.sorted(by: >) {
//            insert(newElement, at: index)
//        }
//    }
//}
//
//extension Array {
//    func rotate(moveRight: Bool = true, numOfRotations: Int = 1) -> Array<Element>{
//        var arr = self
//        var i = 0
//        while i < numOfRotations {
//            if moveRight {
//                arr.insert(arr.remove(at: arr.count - 1), at: 0)
//            } else {
//                arr.append(arr.remove(at: 0))
//            }
//            i += 1
//        }
//        return arr
//    }
//}
//
//extension UIApplication {
//    static var release: String {
//        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String? ?? "x.x"
//    }
//    static var build: String {
//        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String? ?? "x"
//    }
//    static var version: String {
//        return "\(release).\(build)"
//    }
//}
//
//extension UIStackView {
//    func addBackground(color: UIColor) {
//        let subView = UIView(frame: bounds)
//        subView.backgroundColor = color
//        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        insertSubview(subView, at: 0)
//    }
//}
//
//extension String {
//    func withoutHTMLEntities() -> String {
//        return self.replacingOccurrences(of: "&nbsp;", with: " ")
//    }
//}


func performUtilityThread(closure: @escaping (() -> Void), after delayInterval: Double = 0.4) {
    DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + delayInterval, execute: closure)
}


extension Double {
    
    func formattedPrice() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")
        formatter.groupingSeparator = ","
        let formatted = formatter.string(from: self as NSNumber) ?? ""
        
        return ("AED " + formatted)
    }

}

extension String {
    
    func isValidPhone() -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
}

extension String {
   var isNumeric: Bool {
     return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
   }
}


extension UITextField {

    func underline() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.borderStyle = .none
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
