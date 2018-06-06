//
//  FromAirSampleViewController.swift
//
//  Created by ToKoRo on 2018-06-06.
//

import UIKit
import Lottie

class FromAirSampleViewController: UIViewController {
    @IBOutlet weak var animationArea: UIView?

    weak var animationView: LOTAnimationView?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        downloadAnimationJSON { [weak self] filePath in
            self?.setupAnimation(with: filePath)
            self?.animationView?.play()
        }
    }

    private func downloadAnimationJSON(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/tokorom/lottie-ios-sample/master/app/resource/animations/yes.json") else {
            return
        }

        let task = URLSession.shared.downloadTask(with: url) { url, _, error in
            guard let filePath = url?.path else {
                print("handle error: \(String(describing: error))")
                return
            }

            DispatchQueue.main.async {
                completion(filePath)
            }
        }

        task.resume()
    }

    private func setupAnimation(with filePath: String) {
        guard let view = animationArea else {
            return
        }

        let animationView = LOTAnimationView(filePath: filePath)
        animationView.frame = animationView.sceneModel?.compBounds ?? view.bounds

        view.addSubview(animationView)
        self.animationView = animationView
    }
}
