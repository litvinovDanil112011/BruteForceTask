import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var passwordTextFild: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    var isBlack: Bool = false {
        didSet {
            self.view.backgroundColor = isBlack ? .white : .black
            self.label.textColor = isBlack ? .black : .systemBlue
        }
    }
    
    let queue = DispatchQueue(label: "queue", qos: .utility)
    var password = String()
    
    //MARK: Actions
    @IBAction func passwordStart(_ sender: Any) {
        
        password = passwordTextFild.text ?? ""
        
        queue.async {
            self.bruteForce(passwordToUnlock: self.password)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            if self.label.text == self.password {
                self.activitiIndicator.stopAnimating()
                self.label.text = "You password \(self.password)"
            }
        })
    }

@IBAction func onBut(_ sender: Any) {
        isBlack.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        greteRandomPassword()
    }
    private func setupView(){
        passwordTextFild.isSecureTextEntry = true
    }
}
