//
//  ViewController.swift
//  X of 365
//
// Copyright © 2017 Jeremy Brooks.
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker : UIDatePicker!
    @IBOutlet weak var dayLabel : UILabel!
    @IBOutlet weak var yearLabel : UILabel!
    @IBOutlet weak var messageLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.becomeFirstResponder()
        setLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.datePicker.date = Date()
            setLabels()
        }
    }
    
    func setLabels() {
        let day = self.datePicker.calendar.ordinality(of: .day, in: .year, for: self.datePicker.date)
        let year = self.datePicker.calendar.component(.year, from: self.datePicker.date)
        
        self.dayLabel.text = "\(day ?? 0)"
        self.yearLabel.text = "of \(year)"
        
    }

    @IBAction func dateChanged(sender: UIDatePicker) {
        setLabels()
    }
    
    @IBAction func copyTouched(sender: UIButton) {
        let calendar = self.datePicker.calendar!
        let date = self.datePicker.date
        
        // Calculate start and end of the current year (or month with `.month`):
        let interval = calendar.dateInterval(of: .year, for: date)!
        
        // Compute difference in days:
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        
        let day = self.datePicker.calendar.ordinality(of: .day, in: .year, for: self.datePicker.date)
        
      
        UIPasteboard.general.string = "\(day ?? 0)/\(days)"
        
        self.messageLabel.alpha = 1.0
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseOut, animations: {
                        self.messageLabel.alpha = 0.0
        }, completion:  nil)
    }
}
