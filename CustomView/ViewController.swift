//
//  ViewController.swift
//  CustomViewChallenge
//
//  Created by Jonathan Rasmusson Work Pro on 2019-10-17.
//  Copyright © 2019 Rasmusson Software Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let margin: CGFloat = 20
    let spacing: CGFloat = 32

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    func setupNavigationBar() {
        navigationItem.title = "Playback"
    }

    /*
     
     Challenge here is to take the various controls and practice extracting components as subViews (UIViews).

     Two good candidates for extraction are the:

      - RowView (label and a switch)
      - CrossfadeView (label, progressbar, and max min label)
     
     ┌───────────────┐        ┌───────────────┐
     │               │        │               │
     │               ├────────▶    RowView    │ x4
     │               │        │               │
     │               │        └───────────────┘
     │   Challenge   │ extract
     │               │
     │               │        ┌───────────────┐
     │               │        │               │
     │               ├────────▶ CrossfadeView │ x1
     │               │        │               │
     └───────────────┘        └───────────────┘
     
     See if you can extract those into their own custom UIViews and then lay those out.
     
     */
    func setupViews() {
        let offline = RowView(labelText: "Offline", isSwitchOn: false)
        let offlineSublabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        
        let crossFade = CrossfadeView()
        let gaplessPlayback = RowView(labelText: "Gapless Playback", isSwitchOn: true)
        let hideSong = RowView(labelText: "Hide Unplayable Songs", isSwitchOn: true)
        let enableNormalization = RowView(labelText: "Enable Audio Normalization", isSwitchOn: true)
        
        offline.translatesAutoresizingMaskIntoConstraints = false
        offlineSublabel.translatesAutoresizingMaskIntoConstraints = false
        crossFade.translatesAutoresizingMaskIntoConstraints = false
        gaplessPlayback.translatesAutoresizingMaskIntoConstraints = false
        hideSong.translatesAutoresizingMaskIntoConstraints = false
        enableNormalization.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(offline)
        view.addSubview(offlineSublabel)
        view.addSubview(crossFade)
        view.addSubview(gaplessPlayback)
        view.addSubview(hideSong)
        view.addSubview(enableNormalization)
        
        // offline
        NSLayoutConstraint.activate([
            offline.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            offline.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            view.trailingAnchor.constraint(equalTo: offline.trailingAnchor, constant: margin)
        ])

        // offline sublabel
        NSLayoutConstraint.activate([
            offlineSublabel.topAnchor.constraint(equalTo: offline.bottomAnchor, constant: margin),
            offlineSublabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            view.trailingAnchor.constraint(equalTo: offlineSublabel.trailingAnchor, constant: margin)
        ])
        
        // crossFade
        NSLayoutConstraint.activate([
            crossFade.topAnchor.constraint(equalTo: offlineSublabel.bottomAnchor, constant: margin),
            crossFade.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            crossFade.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin)
        ])
        
        // gapless
        NSLayoutConstraint.activate([
            gaplessPlayback.topAnchor.constraint(equalTo: crossFade.bottomAnchor, constant: margin),
            gaplessPlayback.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            view.trailingAnchor.constraint(equalTo: gaplessPlayback.trailingAnchor, constant: margin)
        ])

        // hideSong
        NSLayoutConstraint.activate([
            hideSong.topAnchor.constraint(equalTo: gaplessPlayback.bottomAnchor, constant: margin),
            hideSong.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            view.trailingAnchor.constraint(equalTo: hideSong.trailingAnchor, constant: margin)
        ])

        // enable normal
        NSLayoutConstraint.activate([
            enableNormalization.topAnchor.constraint(equalTo: hideSong.bottomAnchor, constant: margin),
            enableNormalization.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            view.trailingAnchor.constraint(equalTo: enableNormalization.trailingAnchor, constant: margin)
        ])
    }
}


