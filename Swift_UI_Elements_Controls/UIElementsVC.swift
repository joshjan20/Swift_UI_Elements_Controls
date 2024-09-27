//
//  UIElementsVC.swift
//  Swift_UI_Elements_Controls
//
//  Created by JJ on 27/09/24.
//

import UIKit

class UIElementsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Create UI Elements
    
    let segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["First", "Second", "Third"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 0.5
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    let pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    // Data for Picker View
    let pickerData = ["Option 1", "Option 2", "Option 3", "Option 4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .white
        
        // Add all UI elements to the view
        view.addSubview(segmentControl)
        view.addSubview(slider)
        view.addSubview(switchControl)
        view.addSubview(progressView)
        view.addSubview(pageControl)
        view.addSubview(stepper)
        view.addSubview(datePicker)
        view.addSubview(pickerView)
        
        // Set Picker View delegates
        pickerView.dataSource = self
        pickerView.delegate = self
        
        setupConstraints()
        
        // Add actions for controls
        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        switchControl.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        pageControl.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
    }
    
    // Set up constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Segment Control Constraints
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentControl.widthAnchor.constraint(equalToConstant: 250),
            
            // Slider Constraints
            slider.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.widthAnchor.constraint(equalToConstant: 250),
            
            // Switch Constraints
            switchControl.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
            switchControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Progress View Constraints
            progressView.topAnchor.constraint(equalTo: switchControl.bottomAnchor, constant: 20),
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 250),
            
            // Page Control Constraints
            pageControl.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Stepper Constraints
            stepper.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20),
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Date Picker Constraints
            datePicker.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 20),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Picker View Constraints
            pickerView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.widthAnchor.constraint(equalToConstant: 250),
            pickerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // Actions for the UI elements
    @objc func segmentChanged() {
        print("Segment changed to \(segmentControl.selectedSegmentIndex)")
    }
    
    @objc func sliderChanged() {
        print("Slider value: \(slider.value)")
    }
    
    @objc func switchChanged() {
        print("Switch is \(switchControl.isOn ? "ON" : "OFF")")
    }
    
    @objc func stepperChanged() {
        print("Stepper value: \(stepper.value)")
    }
    
    @objc func pageChanged() {
        print("Page Control current page: \(pageControl.currentPage)")
    }
    
    // Picker View Data Source and Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected: \(pickerData[row])")
    }
}

