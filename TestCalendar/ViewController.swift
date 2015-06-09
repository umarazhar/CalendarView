//
//  ViewController.swift
//  TestCalendar
//
//  Created by Umar Azhar on 2015-06-08.
//  Copyright (c) 2015 RaceRoster. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let INIT_YEAR: Int = 2015
    let INIT_MONTH: Int = 1
    let INIT_DAY: Int = 1
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentCalendar: NSCalendar = NSCalendar.currentCalendar()
    var currentDate: NSDate = NSDate()
    var components: NSDateComponents = NSDateComponents()
    
    let dateStringFormatter = NSDateFormatter()
    var initDate:NSDate = NSDate()
    
    var months: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        months.append("January")
        months.append("February")
        months.append("March")
        months.append("April")
        months.append("May")
        months.append("June")
        months.append("July")
        months.append("August")
        months.append("September")
        months.append("October")
        months.append("November")
        months.append("December")
        
        dateStringFormatter.dateFormat = "yyy-MM-dd"
        initDate = dateStringFormatter.dateFromString("2015-02-01")!
        
        tableView.reloadData()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (currentCalendar.component(NSCalendarUnit.CalendarUnitYear, fromDate: currentDate) - INIT_YEAR) * 12 + currentCalendar.component(NSCalendarUnit.CalendarUnitMonth, fromDate: currentDate) + 12
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var year = INIT_YEAR + section / 12
        println(year)
        if (!(year % 100 != 0 && year % 4 == 0 || year % 400 == 0)) {
            println("not a leap year")
            if (section == 1) {
                return 4
            }
        }
        
        return 5
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return months[section % 12]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var year = INIT_YEAR + indexPath.section / 12
        var month = indexPath.section % 12
        var week = indexPath.row + 1
        
        var tmpDate = dateStringFormatter.dateFromString("\(year)-\(month + 1)-01")
//        println(tmpDate)
        tmpDate = currentCalendar.dateBySettingUnit(NSCalendarUnit.CalendarUnitWeekOfMonth, value: week, ofDate: tmpDate!, options: nil)
        
        var tmpCell = tableView.dequeueReusableCellWithIdentifier("WeekdayCell") as! WeekdayCell
        tmpCell.populate(currentCalendar, currentDate: tmpDate!)
        return tmpCell
    }

}

