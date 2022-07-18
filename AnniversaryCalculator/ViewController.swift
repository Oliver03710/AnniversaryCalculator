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
    
    let formatter = DateFormatter()

    
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
        
        guard let date1 = UserDefaults.standard.string(forKey: "dates1") else { return }
        button1.setTitle(date1, for: .normal)
        
        guard let date2 = UserDefaults.standard.string(forKey: "dates2") else { return }
        button2.setTitle(date2, for: .normal)
        
        guard let date3 = UserDefaults.standard.string(forKey: "dates3") else { return }
        button3.setTitle(date3, for: .normal)
        
        guard let date4 = UserDefaults.standard.string(forKey: "dates4") else { return }
        button4.setTitle(date4, for: .normal)
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
        datepicker.sizeToFit()
        if #available(iOS 14.0, *) {
            datepicker.preferredDatePickerStyle = .inline
        } else if #available(iOS 13.4, *) {
            datepicker.preferredDatePickerStyle = .wheels
        } else {
            datepicker.datePickerMode = .date
        }
    }
    
    func showAlertController() {
    //  흰 바탕 - UIAlertController
        let alert = UIAlertController(title: "데이터 저장", message: "하시겠습니까?", preferredStyle: .alert)

    //  버튼
        let ok = UIAlertAction(title: "확인", style: .default) { action -> Void in
            UserDefaults.standard.set(self.button1.titleLabel?.text, forKey: "dates1")
            UserDefaults.standard.set(self.button2.titleLabel?.text, forKey: "dates2")
            UserDefaults.standard.set(self.button3.titleLabel?.text, forKey: "dates3")
            UserDefaults.standard.set(self.button4.titleLabel?.text, forKey: "dates4")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    //  1+2
        alert.addAction(cancel)
        alert.addAction(ok)

    //  present
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    @IBAction func datePickersValueChanged(_ sender: UIDatePicker) {
        

        let datePicker = sender

        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "GMT+00:00")
        datePicker.timeZone = TimeZone(secondsFromGMT: 9 * 60 * 60)
        datePicker.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년\nMM월 dd일"
//        let latterDate = datePicker.date
    
        
//        두 날짜 사이 일자 계산
//        let exactDate1 = specialDates[0]
//        guard let earlierDate1 = formatter.date(from: exactDate1) else { return }
//        guard let days = (latterDate - earlierDate1).day else { return }
//        label1.text = "D+" + String(days)
//        let exactDate2 = specialDates[1]
//        guard let earlierDate2 = formatter.date(from: exactDate2) else { return }
//        guard let days = (latterDate - earlierDate2).day else { return }
//        label2.text = "D+" + String(days)
//        let exactDate3 = specialDates[2]
//        guard let earlierDate3 = formatter.date(from: exactDate3) else { return }
//        guard let days = (latterDate - earlierDate3).day else { return }
//        label3.text = "D+" + String(days)
//        let exactDate4 = specialDates[3]
//        guard let earlierDate4 = formatter.date(from: exactDate4) else { return }
//        guard let days = (latterDate - earlierDate4).day else { return }
//        label4.text = "D+" + String(days)
        
//        며칠 뒤..
        let dates1 = datePicker.date + (86400 * 100)
        button1.setTitle(formatter.string(from: dates1), for: .normal)
        let dates2 = datePicker.date + (86400 * 200)
        button2.setTitle(formatter.string(from: dates2), for: .normal)
        let dates3 = datePicker.date + (86400 * 300)
        button3.setTitle(formatter.string(from: dates3), for: .normal)
        let dates4 = datePicker.date + (86400 * 400)
        button4.setTitle(formatter.string(from: dates4), for: .normal)
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        showAlertController()
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        for i in 1...4 {
            UserDefaults.standard.removeObject(forKey: "dates\(i)")
        }
    }
}

