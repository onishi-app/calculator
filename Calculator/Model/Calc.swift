//
//  Calc.swift
//  Calculator
//
//  Created by ryosuke on 2021/02/23.
//

import Foundation
import UIKit

enum CalcType {
    case plus
    case minus
    case multiply
    case divide
}

struct Calc {
    // 一つ目の値
    var firstValue: Double = 0
    // 二つ目の値
    var secondValue: Double = 0
    // ラベルに表示する文字
    var firstText: String = ""
    var secondText: String = ""
    // +, -, ×, ÷ が押されていないかチェック
    var type: CalcType?
    
    // 数字もしくはドットが押された時の処理
    mutating func pushNumber(number: Int) -> String {
        // ÷, ×, +, - が押されているかどうかチェック
        if type == nil {
            // 押されていない場合
            if number == 10 {
                // 押したボタンがドットの場合
                if firstText == "" {
                    // 最初にドットを押した場合
                    firstText = "0."
                } else {
                    firstText += "."
                }
            } else {
                self.firstText += String(number)
            }
            
            // 最後がドットで終わる場合は末尾に0を追加する
            let value = number != 10 ? Double(firstText) : Double(firstText + "0")
            firstValue = value!
            
            return firstText
            
        } else {
            if number == 10 {
                if secondText == "" {
                    secondText = "0."
                } else {
                    secondText += "."
                }
            } else {
                self.secondText += String(number)
            }
            
            let value = number != 10 ? Double(secondText) : Double(secondText + "0")
            secondValue = value!
            
            return secondText
            
        }
    }
    
    // 数字以外のボタン押された時の処理
    mutating func pushOther(buttonNumber number: Int) -> String {
        switch number {
        case 0:
            // Cが押された時の処理 -> 全ての情報を初期化する
            firstValue = 0
            secondValue = 0
            firstText = ""
            secondText = ""
            type = nil
            return "0"
        case 1:
            // +/-が押された時の処理
            if type == nil {
                // +や-が押されていない場合
                firstValue *= -1
                firstText = String(firstValue)
                return firstText
            } else {
                // すでに+や-が押されていた場合
                secondValue *= -1
                secondText = String(secondValue)
                return secondText
            }
        case 2:
            if type == nil {
                firstValue /= 100
                firstText = String(firstValue)
                return firstText
            } else {
                secondValue /= 100
                secondText = String(secondValue)
                return secondText
            }
        case 3:
            if let brforeType = type {
                let result = alreadySetType(type: brforeType)
                type = .divide
                return result
            } else {
                type = .divide
                return firstText
            }
        case 4:
            if let brforeType = type {
                let result = alreadySetType(type: brforeType)
                type = .multiply
                return result
            } else {
                type = .multiply
                return firstText
            }
        case 5:
            if let brforeType = type {
                let result = alreadySetType(type: brforeType)
                type = .minus
                return result
            } else {
                type = .minus
                return firstText
            }
        case 6:
            if let brforeType = type {
                let result = alreadySetType(type: brforeType)
                type = .plus
                return result
            } else {
                type = .plus
                return firstText
            }
        case 7:
            if type == nil {
                return firstText
            } else {
                var value: Double
                switch type {
                case .divide:
                    value = firstValue / secondValue
                case .multiply:
                    value = firstValue * secondValue
                case .minus:
                    value = firstValue - secondValue
                case .plus:
                    value = firstValue + secondValue
                case .none:
                    return ""
                }
                firstValue = value
                firstText = String(firstValue)
                secondText = ""
                return String(value)
            }
        default:
            return ""
        }
    }

    mutating func alreadySetType(type: CalcType) -> String {
        var value: Double
        switch type {
        case .divide:
            value = firstValue / secondValue
        case .multiply:
            value = firstValue * secondValue
        case .minus:
            value = firstValue - secondValue
        case .plus:
            value = firstValue + secondValue
        }
        firstValue = value
        firstText = String(firstValue)
        secondText = ""
        return String(value)
    }
}
