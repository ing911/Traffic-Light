import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var redLight: UIView!
    @IBOutlet private var yellowLight: UIView!
    @IBOutlet private var greenLight: UIView!
    
    @IBOutlet private var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
        
//        print("Размер стороны, доступный в методе viewDidLoad: \(redLight.frame.height)")
    }
    
//    override func viewWillLayoutSubviews() {
//        redLight.layer.cornerRadius = redLight.frame.width / 2
//        yellowLight.layer.cornerRadius = redLight.frame.width / 2
//        greenLight.layer.cornerRadius = redLight.frame.width / 2
//
//        print("Размер стороны, доступный в методе viewWillLayoutSubviews: \(redLight.frame.height)")
    

    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOff
            currentLight = .red
        }
    }
}

// - MARK: - CurrentLight
extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}
