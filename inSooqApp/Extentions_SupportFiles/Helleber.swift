//
//  extension.swift
//  WaterFront
//
//  Created by Abdullah AL-Soubani on 22/10/2021.
//

import Foundation
import UIKit

class TextFieldPadding: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


extension String {
    func trim() -> String {
          return self.replacingOccurrences(of: "\\n", with: " \n ")
    }
}

class shadowView {
    
}

// MARK: - StoryboardIdentifiable

public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    public static var storyboardIdentifier: String {
        String(describing: self)
    }
    
    public static func instantiate(of storyboard: StoryboardIdentifier = .main) -> Self {
        let storyboard = UIStoryboard(storyboard: storyboard, bundle: Bundle(for: self))
        return storyboard.instantiateViewController()
    }
}

extension UIViewController: StoryboardIdentifiable { }

// MARK: - UIStoryboard

public extension UIStoryboard {
    convenience init(storyboard: StoryboardIdentifier, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}

public struct StoryboardIdentifier: RawRepresentable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension StoryboardIdentifier {
    static let main = StoryboardIdentifier(rawValue: "Main")
}

public enum PresentationType {
    case push
    case present
    case presentWithNavigation
}

public enum Router {
    public static let `default`: NavigationRouter = DefaultRouter()
}

public protocol Navigation { }

public protocol AppNavigation {
    var navigation: Navigation.Type { get }
    
    func viewController(
        for navigation: Navigation,
        sourceViewController: UIViewController?
    ) -> UIViewController
    func navigate(
        using navigation: Navigation,
        from sourceViewController: UIViewController,
        to destinationViewController: UIViewController,
        presentationType: PresentationType,
        modalPresentationStyle: UIModalPresentationStyle,
        modalTransitionStyle: UIModalTransitionStyle,
        animated: Bool
    )
}

public extension AppNavigation {
    @available(iOS 13.0, *)
    func navigate(
        using navigation: Navigation,
        from sourceViewController: UIViewController,
        to destinationViewController: UIViewController,
        presentationType: PresentationType,
        modalPresentationStyle: UIModalPresentationStyle = .automatic,
        modalTransitionStyle: UIModalTransitionStyle,
        animated: Bool = true
    ) {
        switch presentationType {
        case .push:
            sourceViewController.navigationController?.navigationBar.isTranslucent = true
            sourceViewController.navigationController?.pushViewController(destinationViewController, animated: animated)
        case .presentWithNavigation:
            destinationViewController.navigationController?.setNavigationBarHidden(true, animated: false)
            let to = UINavigationController(rootViewController: destinationViewController)
            sourceViewController.navigationController?.present(to, animated: animated)
        default:
            destinationViewController.modalPresentationStyle = modalPresentationStyle
            destinationViewController.modalTransitionStyle = modalTransitionStyle
            destinationViewController.isModalInPresentation = true
            sourceViewController.present(destinationViewController, animated: animated)
        }
    }
}

public protocol NavigationRouter {
    func setupAppNavigations(_ appNavigations: [AppNavigation])
    func setupAppNavigation(_ appNavigation: AppNavigation)
    func navigate<T: Navigation>(using navigation: T, from sourceViewController: UIViewController, presentationType: PresentationType, modalPresentationStyle: UIModalPresentationStyle, modalTransitionStyle: UIModalTransitionStyle, animated: Bool)
    func didNavigate(_ block: @escaping (Navigation) -> Void)
    var appNavigations: [String: AppNavigation] { get }
}

public extension UIViewController {
    @available(iOS 13.0, *)
    func navigate<T: Navigation>(using navigation: T, presentationType: PresentationType = .push, modalPresentationStyle: UIModalPresentationStyle = .automatic,modalTransitionStyle: UIModalTransitionStyle = .coverVertical, animated: Bool = true) {
        Router.default.navigate(using: navigation, from: self, presentationType: presentationType, modalPresentationStyle: modalPresentationStyle, modalTransitionStyle: modalTransitionStyle,animated: animated)
    }
}

public class DefaultRouter: NavigationRouter {
    
    public var appNavigations = [String: AppNavigation]()
    var didNavigateBlocks = [((Navigation) -> Void)]()
    
    public func setupAppNavigations(_ appNavigations: [AppNavigation]) {
        appNavigations.forEach { setupAppNavigation($0) }
    }
    
    public func setupAppNavigation(_ appNavigation: AppNavigation) {
        appNavigations[.init(describing: appNavigation.navigation)] = appNavigation
    }
    
    public func navigate<T: Navigation>(
        using navigation: T,
        from sourceViewController: UIViewController,
        presentationType: PresentationType,
        modalPresentationStyle: UIModalPresentationStyle,
        modalTransitionStyle: UIModalTransitionStyle,
        animated: Bool = true
    ) {
        guard let appNavigation = appNavigations[.init(describing: T.self)] else { return }
        let destinationViewController = appNavigation.viewController(for: navigation, sourceViewController: sourceViewController)
        appNavigation.navigate(
            using: navigation,
            from: sourceViewController,
            to: destinationViewController,
            presentationType: presentationType,
            modalPresentationStyle: modalPresentationStyle,
            modalTransitionStyle: modalTransitionStyle,
            animated: animated
        )
        for block in didNavigateBlocks {
            block(navigation)
        }
    }
    
    public func didNavigate(_ block: @escaping (Navigation) -> Void) {
        didNavigateBlocks.append(block)
    }
}

// Injection helper
public protocol Initializable { init() }
open class RuntimeInjectable: NSObject, Initializable {
    public required override init() {}
}

public func appNavigationFromString(_ appNavigationClassString: String) -> AppNavigation? {
    let appNavClass = NSClassFromString(appNavigationClassString) as? RuntimeInjectable.Type
    let appNav = appNavClass?.init()
    return appNav as? AppNavigation
}


public extension UIApplication {
    static func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
    static func present(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            topViewController()?.present(viewController, animated: animated, completion: completion)
        }
    }
}

public extension UIApplication {
    var visibleViewController: UIViewController? {
        guard let rootViewController = keyWindow?.rootViewController else {
            return nil
        }
        return getVisibleViewController(rootViewController)
    }
    
    private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
        if let presentedViewController = rootViewController.presentedViewController {
            return getVisibleViewController(presentedViewController)
        }
        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }
        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }
        return rootViewController
    }
}

public extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                if #available(iOS 10.0, *) {
                    application.open(URL(string: url)!, options: [:], completionHandler: nil)

                }
                else {
                    application.openURL(URL(string: url)!)
                }
                return
            }
        }
    }
}


public protocol ApplicationService {
    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool

    func applicationWillEnterForeground(_ application: UIApplication)
    func applicationDidEnterBackground(_ application: UIApplication)
    func applicationDidBecomeActive(_ application: UIApplication)
    func applicationWillResignActive(_ application: UIApplication)

    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication)
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication)

    func applicationWillTerminate(_ application: UIApplication)
    func applicationDidReceiveMemoryWarning(_ application: UIApplication)
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void)

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    )
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any]
    ) -> Bool
    
    func application(
        _ application: UIApplication,
        supportedInterfaceOrientationsFor window: UIWindow?
    ) -> UIInterfaceOrientationMask
}

public extension ApplicationService {
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {}

    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        true
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        true
    }

    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {}
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {}

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {}

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any]
    ) -> Bool {
        true
    }
    
    func application(
        _ application: UIApplication,
        supportedInterfaceOrientationsFor window: UIWindow?
    ) -> UIInterfaceOrientationMask {
        .portrait
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) { }
}

open class PluggableApplicationDelegate: UIResponder, UIApplicationDelegate {
    public var window: UIWindow?

    public lazy var lazyServices: [ApplicationService] = {
        services()
    }()

    open func services() -> [ApplicationService] { [] }
}

extension PluggableApplicationDelegate {
    public func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        lazyServices.forEach {
            $0.application(
                application,
                didReceiveRemoteNotification: userInfo,
                fetchCompletionHandler: completionHandler
            )
        }
    }

    public func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // swiftlint:disable reduce_boolean
        lazyServices.reduce(true) {
            $0 && $1.application(application, willFinishLaunchingWithOptions: launchOptions)
        }
    }

    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // swiftlint:disable reduce_boolean
        lazyServices.reduce(true) {
            $0 && $1.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
    }
}

extension PluggableApplicationDelegate {
    public func applicationWillEnterForeground(_ application: UIApplication) {
        lazyServices.forEach { $0.applicationWillEnterForeground(application) }
    }

    public func applicationDidEnterBackground(_ application: UIApplication) {
        lazyServices.forEach { $0.applicationDidEnterBackground(application) }
    }

    public func applicationDidBecomeActive(_ application: UIApplication) {
        lazyServices.forEach { $0.applicationDidBecomeActive(application) }
    }

    public func applicationWillResignActive(_ application: UIApplication) {
        lazyServices.forEach { $0.applicationWillResignActive(application) }
    }
    
    
    public func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        lazyServices.forEach { $0.application(application, performActionFor: shortcutItem, completionHandler: completionHandler)}
    }
}

extension PluggableApplicationDelegate {
    public func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        lazyServices.forEach { $0.applicationProtectedDataWillBecomeUnavailable(application) }
    }

    public func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        lazyServices.forEach { $0.applicationProtectedDataDidBecomeAvailable(application) }
    }
}

extension PluggableApplicationDelegate {
    public func applicationWillTerminate(_ application: UIApplication) {
        lazyServices.forEach { $0.applicationWillTerminate(application) }
    }

    public func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        lazyServices.forEach { $0.applicationDidReceiveMemoryWarning(application) }
    }
}

extension PluggableApplicationDelegate {
    public func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        lazyServices.forEach {
            $0.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }

    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        lazyServices.forEach { $0.application(application, didFailToRegisterForRemoteNotificationsWithError: error) }
    }

    public func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        lazyServices.reduce(true) {
            $0 && $1.application(app, open: url, options: options)
        }
    }
}


class AdapterTextField: UITextField {
    
    var adapter: DataPickerAdapter?
    var didSelectAtIndex: ((Int)-> ())?
    
    var array: [String] = [] { didSet {
        handleAdapter()
    }}
    
    func setItems(items: [String]) {
        array = items
    }
    
    func handleAdapter() {
        adapter = DataPickerAdapter(textField: self)
        adapter?.set(items: array)
        adapter?.selectionHandler = { [weak self] index in
            guard let self = self else { return }
            self.text = self.array[index]
            self.didSelectAtIndex?(index)
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    // Provides left padding for right image
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
               textRect.origin.x -= rightPadding
               return textRect    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }

    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            rightView = imageView
        }
        else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}


import UIKit

public final class DataPickerAdapter: NSObject {
    
    private let textField: UITextField
    private lazy var pickerView: UIPickerView = {
        UIPickerView()
    }()
    
    private var items = [String]() {
        didSet { pickerView.reloadAllComponents() }
    }
    
    private(set) var selectedIndex: Int?
    public var selectionHandler: ((Int) -> Void)?
    
    public init(textField: UITextField) {
        self.textField = textField
        super.init()
        setup()
    }
    
    public func set(items: [String]) {
        self.items = items
        pickerView(pickerView, didSelectRow: .zero, inComponent: .zero)
    }
    
    private func setup() {
        pickerView.dataSource = self
        pickerView.delegate = self
        textField.delegate = self
        textField.inputView = pickerView
    }
    
    public func setSelectedItemAt(_ index: Int) {
        let item = items[safe: index]
        textField.text = item
        selectedIndex = index
        selectionHandler?(index)
    }
}

// MARK: - UITextFieldDelegate

 extension DataPickerAdapter: UITextFieldDelegate {
    public  func textFieldDidEndEditing(_ textField: UITextField) {
        guard selectedIndex == nil else { return }
        textField.text = items[safe: 0]
        selectionHandler?(0)
    }
}

// MARK: - UIPickerViewDataSource

 extension DataPickerAdapter: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

// MARK: - UIPickerViewDelegate

extension DataPickerAdapter: UIPickerViewDelegate {
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = items[safe: row]
        return item
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = items[safe: row]
        textField.text = item
        selectedIndex = row
        selectionHandler?(row)
    }
}

extension DataPickerAdapter {
    public  func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        return false
    }
}

public extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

public extension Array where Element: Collection,
    Element.Iterator.Element: Equatable, Element.Index == Int {
    func indexPath(of item: Element.Iterator.Element) -> IndexPath? {
        for firstArray in self.enumerated() {
            for secondArray in firstArray.element.enumerated() where item == secondArray.element {
                return IndexPath(row: secondArray.offset, section: firstArray.offset)
            }
        }
        return nil
    }
}



public struct DatePickerProperties {
    public var minimumDate: Date?
    public var maximumDate: Date?
    public var pickerMode: UIDatePicker.Mode = .date
    public var format: DateFormat = .year
    
    public init(
        minimumDate: Date? = nil,
        maximumDate: Date? = Date(),
        pickerMode: UIDatePicker.Mode = .date,
        format: DateFormat = .year
    ) {
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.pickerMode = pickerMode
        self.format = format
    }
}

public final class DatePickerAdapter: NSObject {

    private lazy var datePicker = UIDatePicker()
    private let textField: UITextField
    public var properties: DatePickerProperties {
        didSet { setupProperties() }
    }
    public var date: Date? {
        didSet {
            datePicker.date = date ?? Date()
            dateHandler?(datePicker.date)
            textField.text = datePicker.date.toString(format: properties.format)
        }
    }
    
    public var dateHandler: ((Date) -> Void)?
    
    public init(textField: UITextField, properties: DatePickerProperties = DatePickerProperties()) {
        self.textField = textField
        self.properties = properties
        super.init()
        setup()
    }
    
    private func setup() {
        textField.delegate = self
        textField.inputView = datePicker
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        textField.text = properties.maximumDate?.toString(format: properties.format)
        setupProperties()
    }
    
    private func setupProperties() {
        datePicker.datePickerMode = properties.pickerMode
        datePicker.minimumDate = properties.minimumDate
//        datePicker.maximumDate = properties.maximumDate
    }
}

// MARK: - UITextFieldDelegate

extension DatePickerAdapter: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        date = datePicker.date
    }
}

public extension Date {
    func toString(format: DateFormat = .year) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = Locale(identifier: "en_us")
        let string = formatter.string(from: self)
        return string
    }
}


public struct DateFormat: RawRepresentable {
    public private(set) var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension DateFormat {
    static let utcShort = DateFormat(rawValue: "yyyy-MM-dd'T'HH:mm:ss")
    static let utc = DateFormat(rawValue: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    static let iso = DateFormat(rawValue: "yyyy-MM-dd'T'HH:mm:ss+0000")
    static let jsonDateTime = DateFormat(rawValue: "yyyy-MM-dd HH:mm:ss")
    static let yearMonthDay = DateFormat(rawValue: "yyyy-MM-dd")
    static let dayMonthYear = DateFormat(rawValue: "dd-MM-yyyy")
    static let year = DateFormat(rawValue: "yyyy")
    static let minuteHour = DateFormat(rawValue: "HH:mm")
    static let defaultDateTime = DateFormat(rawValue: "MMM, dd yyy hh:mm a")
    static let dayMonthYearSlashed = DateFormat(rawValue: "dd/MM/yyyy")
    static let fullDateTime = DateFormat(rawValue: "E MMM dd, yyyy HH:mm")
    static let defaultDate = DateFormat(rawValue: "MMMM dd, yyyy")
    static let defaultTime = DateFormat(rawValue: "hh:mm a")
}
