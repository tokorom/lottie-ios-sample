//
//  ChangeColorSampleViewController.swift
//
//  Created by ToKoRo on 2018-06-06.
//

import UIKit
import Lottie

class ChangeColorSampleViewController: UIViewController {
    @IBOutlet weak var animationArea: UIView?

    weak var animationView: LOTAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        animationView?.play()
    }

    private func setupAnimation() {
        guard let view = animationArea else {
            return
        }

        let animationView = LOTAnimationView(name: "heart")
        animationView.frame = animationView.sceneModel?.compBounds ?? view.bounds

        animationView.loopAnimation = true
        view.addSubview(animationView)
        self.animationView = animationView
    }

    private func changeAnimationColor(named colorName: String) {
        guard let animationView = animationView else {
            return
        }

        guard let color = UIColor(named: colorName) else {
            assertionFailure("Invalid color")
            return
        }

        let keypath = LOTKeypath(string: "**.Fill 1.Color")
        let callback = LOTColorValueCallback(color: color.cgColor)
        animationView.setValueDelegate(callback, for: keypath)
    }

    @IBAction func blueColorAction(sender: AnyObject) {
        changeAnimationColor(named: "Blue")
    }

    @IBAction func greenColorAction(sender: AnyObject) {
        changeAnimationColor(named: "Green")
    }

    @IBAction func yellowColorAction(sender: AnyObject) {
        changeAnimationColor(named: "Yellow")
    }
}
