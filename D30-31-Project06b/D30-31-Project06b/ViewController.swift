//
//  ViewController.swift
//  D30-31-Project06b
//
//  Created by Ignasi Perez-Valls on 20/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //  ************************************************************
    //  MARK: - Instance properties
    //
    
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let label5 = UILabel()
    
    // D30-04-Create_an_empty_dictionaty_of_views
    var viewsDictionary: [String: UILabel] = [:]
    
    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // D30-02-Labels_setup
        labelsSetup()
        
        // D30-03-Add_labels_to-the_current_view
        addLabelsToCurrentView()
        
        
        // D30-05-Create_a_dictionaty_of_views
        initializeViewsDictionary()
        
//        // D30-06-Add_horizontal_constraints
//        // D30-06-Add_vertical_constraints
//        addConstrainsToCurrentView()
        
        
        addConstrainsToCurrentViewWithMetricsAndPriorities()
        
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    // D30-02-Labels_setup
    private func labelsSetup() {
        // translatesAutoresizingMaskIntoConstraints: Instance method of parent class UIView.
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.red
        label1.text = "THESE"
        // sizeToFit(): Instance method of parent class UIView.
        label1.sizeToFit()
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "LABELS"
        label5.sizeToFit()
    }
    
    
    // D30-03-Add_labels_to-the_current_view
    private func addLabelsToCurrentView() {
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
    }
    
    
    // D30-05-Initialize_dictionary_with_lables
    private func initializeViewsDictionary() {
        viewsDictionary.updateValue(label1, forKey: "label1")
        viewsDictionary.updateValue(label2, forKey: "label2")
        viewsDictionary.updateValue(label3, forKey: "label3")
        viewsDictionary.updateValue(label4, forKey: "label4")
        viewsDictionary.updateValue(label5, forKey: "label5")
    }
    
    
    private func addConstrainsToCurrentView() {
        // D30-06-Add_horizontal_constraints
        for label in viewsDictionary.keys {
            view.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "H:|[\(label)]|",
                    options: [],
                    metrics: nil,
                    views: viewsDictionary)
            )
        }
        
        
        // D30-06-Add_vertical_constraints
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]",
                options: [],
                metrics: nil,
                views: viewsDictionary
            )
        )
    }

    
    private func addConstrainsToCurrentViewWithMetricsAndPriorities() {
        // D30-06-Add_horizontal_constraints
        for label in viewsDictionary.keys {
            view.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "H:|[\(label)]|",
                    options: [],
                    metrics: nil,
                    views: viewsDictionary)
            )
        }
        
        
//        // D30-07-Add_vertical_constraints_without_metrics
//        view.addConstraints(
//            NSLayoutConstraint.constraints(
//                withVisualFormat:           "V:|[label1(==88)]-[label2(==88)]-[label3(==88)]-[label4(==88)]-[label5(==88)]-(>=10)-|",
//                options: [],
//                metrics: nil,
//                views: viewsDictionary
//            )
//        )
        
        
//        //D30-07-Add_vertical_constraints_with_metrics
//        let metrics = ["labelHeight": 88]
//        view.addConstraints(
//            NSLayoutConstraint.constraints(
//                withVisualFormat: "V:|[label1(labelHeight)]-[label2(labelHeight)]-[label3(labelHeight)]-[label4(labelHeight)]-[label5(labelHeight)]->=10-|",
//                options: [],
//                metrics: metrics,
//                views: viewsDictionary
//            )
//        )
        
        
        // D30-07-Add_vertical_constraints_with_metrics_and_constraint_priority
        let metrics = ["labelHeight": 88]
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]->=10-|",
                options: [],
                metrics: metrics,
                views: viewsDictionary
            )
        )
    }

}

