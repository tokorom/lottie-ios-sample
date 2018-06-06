//
//  ChangeImageSampleViewController.swift
//
//  Created by ToKoRo on 2018-06-06.
//

import UIKit
import Lottie

class ChangeImageSampleViewController: UIViewController {
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

        let animationView = LOTAnimationView(name: "call")
        animationView.frame = animationView.sceneModel?.compBounds ?? view.bounds

        animationView.loopAnimation = true
        view.addSubview(animationView)
        self.animationView = animationView

        animationView.logHierarchyKeypaths()
    }

    private func changeImage(named imageName: String) {
        guard let animationView = animationView else {
            return
        }

        let image = UIImage(named: imageName)
        let iconView = UIImageView(image: image)

        let keypath = LOTKeypath(string: "avatar.png")
        animationView.addSubview(iconView, toKeypathLayer: keypath)
    }

    @IBAction func unwindToSample(segue: UIStoryboardSegue) {
        guard let imageName = segue.identifier else {
          return
        }

        changeImage(named: imageName)
    }
}
