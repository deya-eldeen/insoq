//
//  ReportAdView.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 18/04/2021.
//

import UIKit
import DropDown
class ReportAdView: UIView {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var resonsButton: NiceButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var reasonDescTxv: UITextView!
    @IBOutlet var contentView: UIView!
    let resonsDropDown = DropDown()
    lazy var dropDowns: [DropDown] = { return [ self.resonsDropDown ] }()
    
    var vc:UIViewController?
    func setVC(viewController:UIViewController)
    {
        setupDropDownTregers()
        setDesigns()
    }
    func setDesigns(){
        objectCornerRadiusShadow(with: contentView)
        objectCornerRadiusShadow(with: resonsButton)
        objectCornerRadiusShadow(with: reasonDescTxv)
    }
    func xibSetup() {
        
        Bundle.main.loadNibNamed("ReportAdView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        
    }
    //MARK:-Private Methods-
    private func setupDropDownTregers(){
        ///Draw Down down list...
        reasonDescTxv.delegate=self
        reasonDescTxv.text = "Tell us more...".localized
        reasonDescTxv.textColor = UIColor.lightGray

        resonsButton.addTarget(self, action: #selector(resonsAction), for: .touchUpInside)
        
        resonsDropDown.anchorView = resonsButton
        
        resonsDropDown.bottomOffset = CGPoint(x: 0, y: resonsButton.bounds.height)
        resonsDropDown.dataSource = [ "i.e 1","i.e 2","i.e 3" ]
        // Action triggered on selection
        resonsDropDown.selectionAction = { [weak self] (index, item) in
            self?.resonsButton.setTitle(" \(item)", for: .normal)
        }
    }
    
    @objc func resonsAction(){
        resonsDropDown.show()
    }
}
extension ReportAdView: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tell us more...".localized
            textView.textColor = UIColor.lightGray
        }
    }
}

