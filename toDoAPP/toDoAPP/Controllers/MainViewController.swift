//
//  ViewController.swift
//  toDoAPP
//
//  Created by Khawaja Abdul Haleem on 17/05/2023.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    @IBOutlet weak private var clock: UIImageView!
    @IBOutlet weak private var hours: UIImageView!
    @IBOutlet weak private var minutes: UIImageView!
    @IBOutlet weak private var seconds: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeStatus: UILabel!
    @IBOutlet weak var taskView: UIView! {
        didSet {
            taskView.layer.shadowColor = UIColor.black.cgColor
            taskView.layer.shadowOpacity = 0.35
            taskView.layer.shadowOffset = CGSize.zero
            taskView.layer.shadowRadius = 5
            taskView.layer.cornerRadius = 20
        }
    }
    
   
    let second = CGFloat(Date().second * (360 / 60))
    let minute = CGFloat(Date().minute * (360 / 60))
    let hour = (CGFloat(Date().hour * (360/12)) + (CGFloat(Date().minute) * (1.0 / 60) * (360 / 12)))
    var rowSelected = [IndexPath]()
    
    let mCoreDataManager = CoreDataManager()
    var tasksArray = [ModelTask]()
    var name = ""
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialSetup()
        
    }
    
    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        var textField = UITextField()
        let alert = UIAlertController(title: ALERT_TITLE, message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: ALERT_BUTTON_TITLE, style: .default) { (action) in
            
            // what will happen once user clicks add item button
            self.mCoreDataManager.addTask(task: textField.text!)
            self.tasksArray = self.mCoreDataManager.loadTasks()
            self.tasksTableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ALERT_TEXTFIELD_PLACEHOLDER
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func initialSetup() {
        userName.text = "Welcome \(name)"
        tasksTableView.register(UINib(nibName: TASKS_TABLE_VIEW_CELL_NIB, bundle: nil), forCellReuseIdentifier: TASKS_TABLE_VIEW_CELL_IDENTIFIER)
        
        tasksTableView.allowsMultipleSelection = true
        
        setClock()
        tasksArray = mCoreDataManager.loadTasks()
    }
    
    private func setClock() {
        let hourColor = UIColor(red: 0.16, green: 0.41, blue: 0.42, alpha: 1.00)
        let secondColor = UIColor(red: 0.76, green: 0.75, blue: 0.75, alpha: 1.00)
        let minuteColor = UIColor(red: 0.44, green: 0.64, blue: 0.65, alpha: 1.00)
        
        let time = Calendar.current.component(.hour, from: Date())
        
        switch time {
        case 6..<12 : timeStatus.text = TimeStatusEnum.morning.rawValue
        case 12 : timeStatus.text = TimeStatusEnum.noon.rawValue
        case 13..<17 : timeStatus.text = TimeStatusEnum.afternoon.rawValue
        case 17..<22 : timeStatus.text = TimeStatusEnum.evening.rawValue
        default: timeStatus.text = TimeStatusEnum.night.rawValue
        }
        
        drawLine(onView: seconds, from: CGPoint(x: seconds.bounds.width / 2, y: seconds.bounds.height / 2), to: CGPoint(x: seconds.bounds.width / 2, y: 0), colorLine: secondColor, widthLine: 1)
        drawLine(onView: minutes, from: CGPoint(x: minutes.bounds.width / 2, y: minutes.bounds.height / 2), to: CGPoint(x: minutes.bounds.width / 2, y: 35), colorLine: minuteColor, widthLine: 3)
        drawLine(onView: hours, from: CGPoint(x: hours.bounds.width / 2, y: hours.bounds.height / 2), to: CGPoint(x: hours.bounds.width / 2, y: 60), colorLine: hourColor, widthLine: 7)
        
        animatePointers(duration: 60, time: second, pointer: seconds)
        animatePointers(duration: 60 * 60, time: minute, pointer: minutes)
        animatePointers(duration: 60 * 60 * 12, time: hour, pointer: hours)
    }
    
    private func degree2Radian(floatNumber: CGFloat) -> CGFloat {
        let radian = CGFloat(Double.pi) * floatNumber / 180
        return radian
    }
    
    private func drawLine(onView: UIImageView, from fromPoint: CGPoint, to toPoint: CGPoint, colorLine: UIColor, widthLine: CGFloat) {
        UIGraphicsBeginImageContext(onView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        onView.image?.draw(in: onView.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.butt)
        context.setBlendMode(.normal)
        context.setLineWidth(widthLine)
        context.setStrokeColor(colorLine.cgColor)
        context.strokePath()
        onView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    private func animatePointers(duration: CFTimeInterval, time: CGFloat, pointer: UIImageView) {
        pointer.layer.add(setUpLayerAnimation(duration: duration, isRemovedOnCompletion: false, timingFunction: CAMediaTimingFunction(name: .linear), fromValue: degree2Radian(floatNumber: time), byValue: 2 * Double.pi),
                          forKey: TRANSFORM_KEY_PATH)
    }
    
    private func setUpLayerAnimation(keyPath: String = TRANSFORM_KEY_PATH, repeatCount: Float = .infinity, duration: CFTimeInterval, isRemovedOnCompletion: Bool, timingFunction: CAMediaTimingFunction?, fromValue: Any?, byValue: Any?) -> CABasicAnimation {
        let animation = CABasicAnimation()
        animation.keyPath = keyPath
        animation.repeatCount = repeatCount
        animation.duration = duration
        animation.isRemovedOnCompletion = isRemovedOnCompletion
        animation.timingFunction = timingFunction
        animation.fromValue = fromValue
        animation.byValue = byValue
        return animation
    }
    
    
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = tasksArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TASKS_TABLE_VIEW_CELL_IDENTIFIER) as! TasksTableViewCell
        cell.selectionStyle = .none
        cell.taskLabel.text = tasksArray[indexPath.row].task
        
        if item.isDone == true {
            cell.taskCheckBox.image =  UIImage(named: SELECTED_CHECKBOX_IMAGE)
        } else {
            cell.taskCheckBox.image =  UIImage(named: UNSELECTED_CHECKBOX_IMAGE)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tasksArray[indexPath.row].isDone = !tasksArray[indexPath.row].isDone
        mCoreDataManager.saveTasks()
        tasksTableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            
            mCoreDataManager.deleteTask(task: tasksArray[indexPath.row])
            tasksArray.remove(at: indexPath.row)
            tasksTableView.reloadData()
        }
    }
    
}
