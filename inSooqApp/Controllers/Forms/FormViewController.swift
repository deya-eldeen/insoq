//
//  FormViewController.swift
//  inSooqApp
//
//  Created by Deya on 05/04/2022.
//

import Foundation
import DropDown
import PhotosUI

class FormViewController: UIViewController {
    
    var stackView = UIStackView()
    var scrollView = UIScrollView()

    var offset: CGFloat = 20
    var formElements = [UIView]()
    
    // MARK: DropDowns
    var viewPopupListOfItems:ViewPopupListOfItems = .fromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        prepareStackView()
        feedStackView()
        addSearchView()
    }
    
    func addSearchView() {
        viewPopupListOfItems.frame = self.view.bounds
        viewPopupListOfItems.isHidden = true
        self.view.addSubview(viewPopupListOfItems)
    }
    
    func feedStackView() {
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: stackView.frame.height)
        stackView.setNeedsLayout()

    }
    
    func prepareStackView() {
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: offset).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -offset).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.delegate = self
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.alignment = .fill
        
    }

    func updateTextForPicker(with id: PickerID, value: String) {
        
        for element in formElements {
            if type(of: element) == FormPicker.self {
                let picker = (element as! FormPicker)
                if picker.id == id {
                    picker.textfield.text = value
                }
            }
        }
        
    }
    
}

extension FormViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
}
