//
//  SimpleSampleViewController.swift
//
//  Created by ToKoRo on 2018-06-06.
//

import UIKit
import Lottie

class SimpleSampleViewController: UIViewController {
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

        let animationView = LOTAnimationView(name: "yes")
        animationView.frame = animationView.sceneModel?.compBounds ?? view.bounds

        // animationView.loopAnimation = loop
        view.addSubview(animationView)
        self.animationView = animationView
    }
}
