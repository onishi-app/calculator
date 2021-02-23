//
//  ViewController.swift
//  Calculator
//
//  Created by ryosuke on 2021/02/21.
//

import UIKit

class ViewController: UIViewController {

    // 入力情報・計算結果が入るラベル
    @IBOutlet weak var valueLabel: UILabel!
    
    // Cボタン
    @IBOutlet weak var clearButton: UIButton!
    // +/-ボタン
    @IBOutlet weak var changeButton: UIButton!
    // %ボタン
    @IBOutlet weak var percentButton: UIButton!
    // ÷ボタン
    @IBOutlet weak var divideButton: UIButton!
    // ×ボタン
    @IBOutlet weak var multiplyButton: UIButton!
    // -ボタン
    @IBOutlet weak var minusButton: UIButton!
    // +ボタン
    @IBOutlet weak var plusButton: UIButton!
    // =ボタン
    @IBOutlet weak var equalButton: UIButton!
    // 1
    @IBOutlet weak var oneButton: UIButton!
    // 2
    @IBOutlet weak var twoButton: UIButton!
    // 3
    @IBOutlet weak var threeButton: UIButton!
    // 4
    @IBOutlet weak var fourButton: UIButton!
    // 5
    @IBOutlet weak var fiveButton: UIButton!
    // 6
    @IBOutlet weak var sixButton: UIButton!
    // 7
    @IBOutlet weak var sevenButton: UIButton!
    // 8
    @IBOutlet weak var eightButton: UIButton!
    // 9
    @IBOutlet weak var nineButton: UIButton!
    // 0
    @IBOutlet weak var zeroButton: UIButton!
    // .
    @IBOutlet weak var dotButton: UIButton!
    
    
    var calc = Calc()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期入力状態を0にする
        valueLabel.text = "0"
        
        // 各ボタンの形を丸にする
        clearButton.layer.cornerRadius = clearButton.frame.size.width / 2
        changeButton.layer.cornerRadius = changeButton.frame.size.width / 2
        percentButton.layer.cornerRadius = percentButton.frame.size.width / 2
        divideButton.layer.cornerRadius = divideButton.frame.size.width / 2
        multiplyButton.layer.cornerRadius = multiplyButton.frame.size.width / 2
        minusButton.layer.cornerRadius = minusButton.frame.size.width / 2
        plusButton.layer.cornerRadius = plusButton.frame.size.width / 2
        equalButton.layer.cornerRadius = equalButton.frame.size.width / 2
        oneButton.layer.cornerRadius = oneButton.frame.size.width / 2
        twoButton.layer.cornerRadius = twoButton.frame.size.width / 2
        threeButton.layer.cornerRadius = threeButton.frame.size.width / 2
        fourButton.layer.cornerRadius = fourButton.frame.size.width / 2
        fiveButton.layer.cornerRadius = fiveButton.frame.size.width / 2
        sixButton.layer.cornerRadius = sixButton.frame.size.width / 2
        sevenButton.layer.cornerRadius = sevenButton.frame.size.width / 2
        eightButton.layer.cornerRadius = eightButton.frame.size.width / 2
        nineButton.layer.cornerRadius = nineButton.frame.size.width / 2
        zeroButton.layer.cornerRadius = zeroButton.frame.size.height / 2
        dotButton.layer.cornerRadius = dotButton.frame.size.width / 2
    }

    
    // 0~9, . を押した時の処理
    @IBAction func pushNumberButton(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        button.backgroundColor = .lightGray
        UIView.animate(withDuration: 0.5) {
            button.backgroundColor = .darkGray
        }
        // ボタンを押した時に押した数字をラベルに追加する
        valueLabel.text = calc.pushNumber(number: button.tag)
    }
    
    // 数字以外のボタンを押した時の処理
    @IBAction func pushOptionButton(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        valueLabel.text = calc.pushOther(buttonNumber: button.tag)
        
        switch button.tag {
        case 0:
            // Cボタンを押した時の処理
            button.backgroundColor = .white
            UIView.animate(withDuration: 0.5) {
                button.backgroundColor = .lightGray
                self.multiplyButton.backgroundColor = .orange
                self.multiplyButton.setTitleColor(.white, for: .normal)
                self.plusButton.backgroundColor = .orange
                self.plusButton.setTitleColor(.white, for: .normal)
                self.minusButton.backgroundColor = .orange
                self.minusButton.setTitleColor(.white, for: .normal)
                self.divideButton.backgroundColor = .orange
                self.divideButton.setTitleColor(.white, for: .normal)
            }
        case 1,2:
            // +/-, % ボタンを押したとき
            button.backgroundColor = .white
            UIView.animate(withDuration: 0.5) {
                button.backgroundColor = .lightGray
            }
        case 3:
            // ÷ボタンを押した時の処理
            UIView.animate(withDuration: 0.2) {
                button.backgroundColor = .white
                button.setTitleColor(.orange, for: .normal)
                self.multiplyButton.backgroundColor = .orange
                self.multiplyButton.setTitleColor(.white, for: .normal)
                self.plusButton.backgroundColor = .orange
                self.plusButton.setTitleColor(.white, for: .normal)
                self.minusButton.backgroundColor = .orange
                self.minusButton.setTitleColor(.white, for: .normal)
            }
        case 4:
            // ×ボタンを押した時の処理
            UIView.animate(withDuration: 0.2) {
                button.backgroundColor = .white
                button.setTitleColor(.orange, for: .normal)
                self.divideButton.backgroundColor = .orange
                self.divideButton.setTitleColor(.white, for: .normal)
                self.plusButton.backgroundColor = .orange
                self.plusButton.setTitleColor(.white, for: .normal)
                self.minusButton.backgroundColor = .orange
                self.minusButton.setTitleColor(.white, for: .normal)
            }
        case 5:
            // -ボタンを押した時の処理
            UIView.animate(withDuration: 0.2) {
                button.backgroundColor = .white
                button.setTitleColor(.orange, for: .normal)
                self.multiplyButton.backgroundColor = .orange
                self.multiplyButton.setTitleColor(.white, for: .normal)
                self.plusButton.backgroundColor = .orange
                self.plusButton.setTitleColor(.white, for: .normal)
                self.divideButton.backgroundColor = .orange
                self.divideButton.setTitleColor(.white, for: .normal)
            }
        case 6:
            // +ボタンを押した時の処理
            UIView.animate(withDuration: 0.2) {
                button.backgroundColor = .white
                button.setTitleColor(.orange, for: .normal)
                self.multiplyButton.backgroundColor = .orange
                self.multiplyButton.setTitleColor(.white, for: .normal)
                self.divideButton.backgroundColor = .orange
                self.divideButton.setTitleColor(.white, for: .normal)
                self.minusButton.backgroundColor = .orange
                self.minusButton.setTitleColor(.white, for: .normal)
            }
        case 7:
            // =ボタンを押した時の処理
            UIView.animate(withDuration: 0.2) {
                button.backgroundColor = .white
                button.setTitleColor(.orange, for: .normal)
                self.multiplyButton.backgroundColor = .orange
                self.multiplyButton.setTitleColor(.white, for: .normal)
                self.plusButton.backgroundColor = .orange
                self.plusButton.setTitleColor(.white, for: .normal)
                self.minusButton.backgroundColor = .orange
                self.minusButton.setTitleColor(.white, for: .normal)
                self.divideButton.backgroundColor = .orange
                self.divideButton.setTitleColor(.white, for: .normal)
            } completion: { (result) in
                UIView.animate(withDuration: 0.2) {
                    button.backgroundColor = .orange
                    button.setTitleColor(.white, for: .normal)
                }
            }
        default:
            return
        }
    }
    
}

