//
//  ChangeColorSampleViewController.swift
//
//  Created by ToKoRo on 2018-06-06.
//

import UIKit
import Lottie

class ChangeColorSampleViewController: UIViewController {
    @IBOutlet weak var animationArea: UIView?

    weak var animationView: AnimationView?

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

        let animationView = AnimationView(name: "heart")
        animationView.frame = animationView.animation?.bounds ?? view.bounds

        animationView.loopMode = .loop
        view.addSubview(animationView)
        self.animationView = animationView

        animationView.logHierarchyKeypaths()
    }

    private func changeAnimationColor(named colorName: String) {
        guard let animationView = animationView else {
            return
        }

        guard let color = UIColor(named: colorName) else {
            assertionFailure("Invalid color")
            return
        }

        let keypath = AnimationKeypath(keypath: "**.Fill 1.Color")
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let provider = ColorValueProvider(Color(r: Double(red), g: Double(green), b: Double(blue), a: Double(alpha)))
        animationView.setValueProvider(provider, keypath: keypath)
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
