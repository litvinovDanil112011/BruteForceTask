import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var passwordTextFild: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    var isBlack: Bool = true {
        didSet {
            self.view.backgroundColor = isBlack ? .white : .black
            self.label.textColor = isBlack ? .black : .systemBlue
        }
    }
    
    let queue = DispatchQueue(label: "queue", qos: .utility)
    var password = String()
    
    //MARK: Actions
    @IBAction func passwordStart(_ sender: Any) {
    
            // метод которым решаем какой пароль будет либо пользывателя либо рондомный
            if self.passwordTextFild.text == "" {
                queue.async {
                    self.password = self.greteRandomPassword()
                }
                self.passwordTextFild.text = self.password
            } else {
                self.password = self.passwordTextFild.text ?? ""
            }
        
        DispatchQueue.main.async {
            // начало работы индикатора
            self.activitiIndicator.isHidden = false
            self.activitiIndicator.startAnimating()
        }
        
        queue.async {
            self.bruteForce(passwordToUnlock: self.password)
        }
    }

@IBAction func onBut(_ sender: Any) {
    DispatchQueue.main.async {
        self.isBlack.toggle()
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        DispatchQueue.main.async {
            self.passwordTextFild.isSecureTextEntry = true
            self.activitiIndicator.isHidden = true
        }
    }
}
