//
//  RoundedView.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation
import UIKit


class RoundedView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        self.bringToBack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        self.bringToBack()
    }
    
    /// It's an initializer method
    private func commonInit() {
        let bundle = Bundle.init(for: type(of: self))
        bundle.loadNibNamed(CustomViewIdentifier.RoundedView, owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func bringToBack() {
        guard let lastView = subviews.last else { return }
        self.sendSubviewToBack(lastView)
    }
}
