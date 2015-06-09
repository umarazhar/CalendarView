//
//  WeekdayCell.swift
//  TestCalendar
//
//  Created by Umar Azhar on 2015-06-08.
//  Copyright (c) 2015 RaceRoster. All rights reserved.
//

import UIKit

class WeekdayCell: UITableViewCell {
    
    
    @IBOutlet weak var sundayLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    
    var weekLabels: [UILabel] = [UILabel]()
    
    
    func populate(calendar: NSCalendar, var currentDate: NSDate) {
        var numDay: Int = calendar.component(NSCalendarUnit.CalendarUnitWeekday, fromDate: currentDate)
        
        var components: NSDateComponents
        var tmpDay: Int
        
        var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "datePressed:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        weekLabels.append(sundayLabel)
        weekLabels.append(mondayLabel)
        weekLabels.append(tuesdayLabel)
        weekLabels.append(wednesdayLabel)
        weekLabels.append(thursdayLabel)
        weekLabels.append(fridayLabel)
        weekLabels.append(saturdayLabel)
        
        for (var i = 0; i < weekLabels.count; i++) {
            weekLabels[i].text = ""
//            weekLabels[i].backgroundColor = UIColor.whiteColor()
            weekLabels[i].userInteractionEnabled = true
            weekLabels[i].addGestureRecognizer(tapGestureRecognizer)
            println("test")
        }
        
        //has to be less than 7 not less than or equal to because we start one day before
        for (var numDay = calendar.component(NSCalendarUnit.CalendarUnitWeekday, fromDate: currentDate); numDay <= 7; numDay++) {
            tmpDay = calendar.component(NSCalendarUnit.CalendarUnitDay, fromDate: currentDate)
            
            var title: String? = "\(tmpDay)"
            weekLabels[numDay - 1].text = title
            
            currentDate = calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: 1, toDate: currentDate, options: nil)!
            if (calendar.component(NSCalendarUnit.CalendarUnitDay, fromDate: currentDate) == 1) {
                break
            }
        }
    }
    
    func datePressed(sender: UILabel) {
        
//        sender.layer.cornerRadius = sender.frame.width / 2
//        sender.layer.masksToBounds = true
        sender.textColor = UIColor.blueColor()
        sender.backgroundColor = UIColor.redColor()
    }
    
    
}
