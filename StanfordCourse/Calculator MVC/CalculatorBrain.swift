//
//  CalculatorBrain.swift
//  Calculator MVC
//
//  Created by Alexander Handy on 11/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    private var opStack = [Op]()
    
    private var knownOps = [String: Op]()
    
    init() {
        knownOps["+"] = Op.BinaryOperation("x", +)
        knownOps["-"] = Op.BinaryOperation("x"){$1 - $0}
        knownOps["/"] = Op.BinaryOperation("x"){$1 / $0}
        knownOps["x"] = Op.BinaryOperation("x", *)
        knownOps["sq"] = Op.UnaryOperation("sq", sqrt)
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]){
        if ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op {
            case .Operand(let operand):
                return(operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_,let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                     return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }

            }
        }
        
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, _) = evaluate(opStack)
        return result
    }
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        
    }
    
}

