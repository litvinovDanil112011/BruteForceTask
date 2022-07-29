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
        // метод которым решаем какой пароль будет либо пользывателя либо рондомный
        if passwordTextFild.text == "" {
            password = greteRandomPassword()
            passwordTextFild.text = password
        } else {
            password = passwordTextFild.text ?? ""
        }
        // начало работы индикатора
        activitiIndicator.isHidden = false
        activitiIndicator.startAnimating()
        
        queue.async {
            self.bruteForce(passwordToUnlock: self.password)
        }
    }

@IBAction func onBut(_ sender: Any) {
        isBlack.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    private func setupView(){
        passwordTextFild.isSecureTextEntry = true
        activitiIndicator.isHidden = true
    }
}
