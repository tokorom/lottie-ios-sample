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

        guard let path = Bundle.main.path(forResource: "yes", ofType: "json") else {
            return
        }

        let animationView = LOTAnimationView(filePath: path)
        animationView.frame = animationView.sceneModel?.compBounds ?? view.bounds

        animationView.loopAnimation = true
        view.addSubview(animationView)
        self.animationView = animationView
    }
}