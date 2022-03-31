//
//  TableState.swift
//  orood
//
//  Created by Deya on 25/12/2021.
//

import UIKit

protocol CustomViewProtocol {
    var contentView: UIView! { get }
    func commonInit(for customViewName: String)
}

extension CustomViewProtocol where Self: UIView {
    func commonInit(for customViewName: String){
        Bundle.main.loadNibNamed(customViewName, owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

class TableState: UIView, CustomViewProtocol {
    
    static let id = "TableState"
    
    @IBOutlet var contentView: UIView!

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var actionButton: UIButton!

    @IBOutlet var interestView: UIView!
    @IBOutlet var interestLabel: UILabel!
    @IBOutlet var notificationLabel: UILabel!

    @IBAction func didTapActionButton() {
        NotificationCenter.default.post(name: Notification.Name("didTapInterestsActionButton"), object: nil)
    }
    
    var forInterestTab = false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit(for: TableState.id)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: TableState.id)
    }
    
    init (frame: CGRect, title: String = "", subtitle: String = "", buttonTitle: String = "", buttonImage: UIImage?, forInterestTab: Bool = false) {
        super.init(frame: frame)
        
        self.forInterestTab = forInterestTab
        
        commonInit(for: TableState.id)
        titleLabel.text = title
        subtitleLabel.text = subtitle
        actionButton.setTitle(buttonTitle, for: .normal )
        
        actionButton.isHidden = (buttonTitle.isEmpty) ? (true) : (false)
                
        if (interestView != nil) {
            interestView.isHidden = !(forInterestTab)
        }
        
        interestLabel.text = "interests_hint_interests".localized
        notificationLabel.text = "interests_hint_notifications".localized

    }
    
    
}
