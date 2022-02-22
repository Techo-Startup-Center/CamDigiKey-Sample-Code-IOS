//
//  ViewController.swift
//  CamDigiKey-Sample-Code-iOS
//
//  Created by Techo Startup Center on 22/2/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginWithCamDigiKey(_ sender: UIButton) {
        // MARK : Step 1. Add your logic for requesting `loginToken` from Client API Server
        let loginToken = "LOGIN_TOKEN_RESPONDED_FROM_CLIENT_API_SERVER"
        // MARK : Step 2. Generate login request with `loginToken` to CamDigiKey App
        let url = URL(string: "camdigikey://login?token=\(loginToken)")
        UIApplication.shared.open(url!) { (result) in
            if result {
                let awaitingVC = AwaitingAuthorizationVC()
                awaitingVC.modalPresentationStyle = .fullScreen
                awaitingVC.delegate = self
                self.present(awaitingVC, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Login Failed", message: "Please Download CamDigiKey App from AppStore to continue", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Open AppStore", style: .default, handler: { _ in
                    if let url = URL(string: "https://apps.apple.com/kh/app/camdigikey/id1509386989") {
                        UIApplication.shared.open(url)
                    }
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

}

extension ViewController: CamDigiKeyClientDelegate {
    func didAuthorizedLoginRequest(authToken: String) {
        print("Login success, authToken: \(authToken)")
        // MARK : Step 3. Add your logic to request for `accessToken` with `authToken` from Client API Server
        // MARK : Step 4. Add your logic to request for user information with `accessToken` from Client API Server
        
    }
    
    func didFailAuthorizedLoginRequest(message: String) {
        print("Login failed, message: \(message)")
    }
}

