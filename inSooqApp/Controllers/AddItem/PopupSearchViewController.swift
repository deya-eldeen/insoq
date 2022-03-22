//
//  PopupSearchViewController.swift
//  inSooqApp
//
//  Created by Yasser Ali on 03/01/2022.
//

import UIKit

protocol PopupSearchViewControllerDelegat: NSObject {
    func selectedField(value: String)
}
class PopupSearchViewController: UIViewController {
    
    // MARK: Variables
    weak var delegate: PopupSearchViewControllerDelegat?
    var list = [String]() {
        didSet {
            if isViewLoaded {
                tableView.reloadData()
            }
        }
    }
    
    var prevList = [String]() {
        didSet {
            if isViewLoaded {
                tableView.reloadData()
            }
        }
    }
    
    var isSearchMode = false {
        didSet {
            
            if isSearchMode == false {
                list = prevList
            } else {
                list = prevList.filter({$0.localizedCaseInsensitiveContains(serachTextField.text ?? "")})
            }
        }
    }
    
    // MARK: @IBOutlet
    @IBOutlet weak var serachTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func closeClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prevList = list
        removeSelfWhenTappedAround()
        serachTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    //MARK: - @objc
    @objc func textFieldDidChange(textField: UITextField) {
        
        guard let text = textField.text else { return}
        if text.isEmpty {
            isSearchMode = false
        } else {
            isSearchMode = true
        }
    }
    
    //MARK: - Functions
    func removeSelfWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: nil)
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
}

// MARK: UITableViewDelegate
extension PopupSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownTableViewCell", for: indexPath) as! DropDownTableViewCell
        cell.titleLabel.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedField(value: list[indexPath.row])
        dismiss(animated: true)
    }
}

// MARK: UIGestureRecognizerDelegate
extension PopupSearchViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view == gestureRecognizer.view {
            dismiss(animated: true, completion: nil)
        }
        return touch.view == gestureRecognizer.view
    }
}
