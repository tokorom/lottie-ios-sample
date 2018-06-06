//
//  ControlSampleViewController.swift
//
//  Created by ToKoRo on 2018-06-06.
//

import UIKit
import Lottie

class ControlSampleViewController: UIViewController {
    @IBOutlet weak var animationArea: UIView?

    weak var animationView: LOTAnimationView?

    lazy var tableViewController: ControlSampleTableViewController = {
        for case let viewController as ControlSampleTableViewController in children {
            return viewController
        }
        fatalError("Invalid structure")
    }()

    lazy var speedLabel: UILabel? = {
        return tableViewController.speedLabel
    }()

    lazy var stepper: UIStepper? = {
        return tableViewController.stepper
    }()

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

        view.addSubview(animationView)
        self.animationView = animationView

        let speedValue = Double(animationView.animationSpeed)
        stepper?.value = speedValue
        speedLabel?.text = String(speedValue)
    }

    @IBAction func playAction(sender: AnyObject) {
        animationView?.completionBlock = { finished in
            print("### finished: \(finished)")
        }

        animationView?.play()
    }

    @IBAction func pauseAction(sender: AnyObject) {
        animationView?.pause()
    }

    @IBAction func stopAction(sender: AnyObject) {
        animationView?.stop()
    }

    @IBAction func loopAction(`switch`: UISwitch) {
        guard let animationView = animationView else {
            return
        }

        animationView.loopAnimation = `switch`.isOn
    }

    @IBAction func reverseAction(`switch`: UISwitch) {
        guard let animationView = animationView else {
            return
        }

        animationView.autoReverseAnimation = `switch`.isOn
    }

    @IBAction func speedAction(stepper: UIStepper) {
        guard let animationView = animationView else {
            return
        }

        let value = floor(stepper.value * 10) / 10
        animationView.animationSpeed = CGFloat(value)
        speedLabel?.text = String(value)
    }
}

class ControlSampleTableViewController: UITableViewController {
    @IBOutlet weak var speedLabel: UILabel?
    @IBOutlet weak var stepper: UIStepper?
}
