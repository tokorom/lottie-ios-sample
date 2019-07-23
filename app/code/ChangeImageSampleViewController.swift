//
//  ChangeImageSampleViewController.swift
//
//  Created by ToKoRo on 2018-06-06.
//

import UIKit
import Lottie

class ChangeImageSampleViewController: UIViewController {
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

        let animationView = AnimationView(name: "call")
        animationView.frame = animationView.animation?.bounds ?? view.bounds

        animationView.loopMode = .loop
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
        let subview = AnimationSubview()
        subview.addSubview(iconView)
        subview.frame = iconView.bounds

        let keypath = AnimationKeypath(keypath: "avatar.png")
        animationView.addSubview(subview, forLayerAt: keypath)
    }

    @IBAction func unwindToSample(segue: UIStoryboardSegue) {
        guard let imageName = segue.identifier else {
          return
        }

        changeImage(named: imageName)
    }
}
