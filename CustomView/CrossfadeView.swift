//
//  CrossfadeView.swift
//  CustomViewChallenge
//
//  Created by Shah Md Imran Hossain on 26/3/23.
//  Copyright © 2023 Rasmusson Software Consulting. All rights reserved.
//

import UIKit

class CrossfadeView: UIView {
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let headerLabel = makeLabel(withText: "CrossFade")
        let minLabel = makeLabel(withText: "0s")
        let maxLabel = makeLabel(withText: "12s")
        let progressView = makeProgressView()
        
        addSubview(headerLabel)
        addSubview(minLabel)
        addSubview(maxLabel)
        addSubview(progressView)
        
        // header label
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        // min label
        NSLayoutConstraint.activate([
            minLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 32),
            minLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.leadingAnchor.constraint(equalTo: minLabel.trailingAnchor, constant: 4)
        ])
        
        
        // progress view
        NSLayoutConstraint.activate([
            maxLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: 4),
            progressView.centerYAnchor.constraint(equalTo: minLabel.centerYAnchor)
        ])
        
        // maxLabel
        NSLayoutConstraint.activate([
            maxLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            maxLabel.centerYAnchor.constraint(equalTo: minLabel.centerYAnchor)
        ])
    }
    
    // Size suggestion
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 100)
    }
}
