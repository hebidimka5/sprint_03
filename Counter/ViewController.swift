//
//  ViewController.swift
//  Counter
//
//  Created by Николай  on 17.01.2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var reButton: UIButton!
    @IBOutlet weak var decreaceButton: UIButton!
    private var counter: Int = 0
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: \(counter)"
        
        historyTextView.text = "История изменений:"
        
        decreaceButton.tintColor = .green
        changeButton.tintColor = .red
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        addHistoryRecord("Значение изменено на +1")
    }
    
    @IBAction func buttonRestart(_ sender: Any) {
        counter = 0
        counterLabel.text = "Значение счётчика: \(counter)"
        addHistoryRecord("значение сброшено")
    }
    
    @IBAction func buttonDecreased(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            addHistoryRecord("Значение изменено на -1")
        } else {
            addHistoryRecord("попытка уменьшить значение счётчика ниже 0")
            
        }
    }
    
    func currentDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    func addHistoryRecord(_ text: String) {
        let record = "[\(currentDateString())]: \(text)"
        historyTextView.text += "\n" + record
    }
}

