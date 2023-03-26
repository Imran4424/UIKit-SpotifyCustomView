//
//  RowView.swift
//  CustomViewChallenge
//
//  Created by Shah Md Imran Hossain on 26/3/23.
//  Copyright © 2023 Rasmusson Software Consulting. All rights reserved.
//

import UIKit

class RowView: UIView {
    var labelText: String
    var isSwitchOn: Bool
    
    init(labelText: String, isSwitchOn: Bool) {
        self.labelText = labelText
        self.isSwitchOn = isSwitchOn
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let label = makeLabel(withText: labelText)
        let onOffSwitch = makeSwitch(isOn: isSwitchOn)
        
        addSubview(label)
        addSubview(onOffSwitch)
        
        // label
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        // on off switch
        onOffSwitch.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        onOffSwitch.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    // A suggestion about size. But one that can be overridden.
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 31)
    }
}
