Let’s create a demonstration app that includes all the UI components you mentioned: **Segmented Control**, **Slider**, **Switch**, **Progress View**, **Page Control**, **Stepper**, **Date Picker**, and **Picker View**.

### Here's a breakdown of what we'll cover:

1. **Segment Control**: Allows you to choose between multiple segments.
2. **Slider**: Lets the user select a value from a continuous range.
3. **Switch**: Provides a toggle control.
4. **Progress View**: Displays a progress indicator.
5. **Page Control**: Shows dots indicating the number of pages and the current page.
6. **Stepper**: Increases or decreases a value.
7. **Date Picker**: Allows date and time selection.
8. **Picker View**: Allows selection of predefined values.

### Full Example:

```swift
import UIKit

class DemoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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
```

### UI Elements Overview:

1. **Segment Control**:
   - Added a segmented control with three options.
   - Logs the selected segment when changed.

2. **Slider**:
   - Allows selecting a continuous value between 0 and 100.
   - Logs the value when the slider is moved.

3. **Switch**:
   - A toggle control that logs whether it’s on or off.

4. **Progress View**:
   - Displays a progress bar initially set to 50%.

5. **Page Control**:
   - Dots representing three pages, logs the current page when changed.

6. **Stepper**:
   - Allows incrementing or decrementing a value between 0 and 10.

7. **Date Picker**:
   - Allows selecting a date and time.

8. **Picker View**:
   - A picker that displays four options (`pickerData`), logs the selected option when changed.

### Running the Code

This creates a full demonstration screen with all these UI components. When you interact with the controls (e.g., adjusting the slider, changing segments, toggling the switch), the console will log the actions and values accordingly.

You can modify the code to display these values on the UI instead of just printing to the console, depending on your application's needs.

Let me know if you have any further questions or need more explanations! 😊
