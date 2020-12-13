//
//  NoDataView.swift
//  Weather
//
//  Created by Bilal Ghanchi on 11/12/20.
//

import Foundation
import UIKit

class NoDataView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnAddCity: UIButton!
    
    weak var delegate: NoDataViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /// It's an initializer method
    private func commonInit() {
        let bundle = Bundle.init(for: type(of: self))
        bundle.loadNibNamed(CustomViewIdentifier.NoDataView, owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    // MARK: Action Events
    /// Action perform when user tap on buttons. It will perform action based on matching case.
    @IBAction func buttonClick(_ sender: UIButton) {
        switch sender {
        case btnAddCity: self.delegate?.buttonAction(sender: sender)
        default: return
        }
    }
}

/// `NoDataViewDelegate` Protocol for the NoDataView class.
protocol NoDataViewDelegate: class {
    func buttonAction(sender: UIButton)
}
