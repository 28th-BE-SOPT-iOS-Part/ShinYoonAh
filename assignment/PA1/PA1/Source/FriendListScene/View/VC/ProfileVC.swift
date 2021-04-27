//
//  ProfileVC.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import UIKit

class ProfileVC: UIViewController {
    var viewTranslation = CGPoint(x: 0, y: 0)

    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var image: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGesture()
        setConfigure()
    }
    
    private func setGesture() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    func setConfigure() {
        if let image = UIImage(named: image ?? "") {
            profileImage.setImage(image, for: .normal)
            profileImage.imageView?.contentMode = .scaleAspectFill
            profileImage.imageView?.sizeToFit()
        }
        userNameLabel.text = name
    }

    @objc
    func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 200 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    @IBAction func touchUpDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
