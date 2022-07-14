//
//  ViewController.swift
//  AnniversaryCalculator
//
//  Created by Junhee Yoon on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    let specialDates = ["2021년\n03월 27일",
                        "2021년\n07월 05일",
                        "2021년\n10월 13일",
                        "2022년\n01월 21일"]
    
    var count = 0

    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    // MARK: - Helper Functions
    
    func configureUI() {
        configureDatePicker()
        
        configureButtons(button1, title: specialDates[0])
        configureButtons(button2, title: specialDates[1])
        configureButtons(button3, title: specialDates[2])
        configureButtons(button4, title: specialDates[3])
        
        configureImages(image1, name: "anni1")
        configureImages(image2, name: "anni2")
        configureImages(image3, name: "anni3")
        configureImages(image4, name: "anni4")

//        configureLabels(label1)
//        configureLabels(label2)
//        configureLabels(label3)
//        configureLabels(label4)
        
        configureLabels(label1, title: "D+100")
        configureLabels(label2, title: "D+200")
        configureLabels(label3, title: "D+300")
        configureLabels(label4, title: "D+400")
        
        
    }
    
    func configureButtons(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(rgb: 0x2acaea), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byCharWrapping
        button.titleLabel?.textAlignment = .center
        button.sizeToFit()
    }
    
    func configureImages(_ imageView: UIImageView, name: String) {
        imageView.image = UIImage(named: name)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
    }
    
    func configureLabels(_ label: UILabel, title: String) {
        label.text = title
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = UIColor(rgb: 0x2acaea)
    }
    
    func configureDatePicker() {
        datepicker.preferredDatePickerStyle = .wheels
        datepicker.sizeToFit()
        if #available(iOS 14.0, *) {
            datepicker.preferredDatePickerStyle = .inline
        }
    }
    
    // MARK: - IBActions
    @IBAction func datePickersValueChanged(_ sender: UIDatePicker) {
        

        let datePicker = sender
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "GMT+00:00")
        datePicker.timeZone = TimeZone(secondsFromGMT: 9 * 60 * 60)
        datePicker.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년\nMM월 dd일"
//        let latterDate = datePicker.date
    

        // 두 날짜 사이 일자 계산
//        switch count {
//        case 0:
//            let exactDate = specialDates[0]
//            guard let earlierDate = formatter.date(from: exactDate) else { return }
//            guard let days = (latterDate - earlierDate).day else { return }
//            label1.text = "D+" + String(days)
//            count += 1
//        case 1:
//            let exactDate = specialDates[1]
//            guard let earlierDate = formatter.date(from: exactDate) else { return }
//            guard let days = (latterDate - earlierDate).day else { return }
//            label2.text = "D+" + String(days)
//            count += 1
//        case 2:
//            let exactDate = specialDates[2]
//            guard let earlierDate = formatter.date(from: exactDate) else { return }
//            guard let days = (latterDate - earlierDate).day else { return }
//            label3.text = "D+" + String(days)
//            count += 1
//        case 3:
//            let exactDate = specialDates[3]
//            guard let earlierDate = formatter.date(from: exactDate) else { return }
//            guard let days = (latterDate - earlierDate).day else { return }
//            label4.text = "D+" + String(days)
//            count = 0
//        default:
//            break
//        }
        
//         며칠 뒤..
        switch count {
        case 0:
            let dates = datePicker.date + (86400 * 100)
            button1.setTitle(formatter.string(from: dates), for: .normal)
            count += 1
        case 1:
            let dates = datePicker.date + (86400 * 200)
            button2.setTitle(formatter.string(from: dates), for: .normal)
            count += 1
        case 2:
            let dates = datePicker.date + (86400 * 300)
            button3.setTitle(formatter.string(from: dates), for: .normal)
            count += 1
        case 3:
            let dates = datePicker.date + (86400 * 400)
            button4.setTitle(formatter.string(from: dates), for: .normal)
            count = 0
        default:
            break
        }

        
    }
    
}

