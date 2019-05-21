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
        
        
        // D30-05-Initialize_dictionary_with_lables
        initializeViewsDictionary()
        
    
//        // D30-06-Add_horizontal_constraints
//        addHorizontalConstarints()
        
        
//        // D30-06-Add_vertical_constraints
//       addVerticalConstraints()
        
//        // D31-01-Add_vertical_constraints_with_height_sizes
//        addVerticalContraintsWithHeightSizes()
        
//        // D31-02-Add_vertical_constraints_with_metrics
//        addVerticalConstraintsWithMetrics()
        
        
//        // D31-03-Add_vertical_constraints_with_metrics_and_constraint_priority
//        addVerticalConstraintsWithMetricsAndPriority()
        
        
//        // D31-04-Add_Horizontal_and_vertical_constraints_with_anchors
//        addConstraintsWithAnchors()
        
        
        // D31-05-Add_constraints_with_anchors_within_safe_area
//        addConstraintsWithAnchorsWithinSafeArea()
        
        addConstraintsWithLeadingAndTrailingAnchorsWithinSafeArea()
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    // D30-02-Labels_setup
    private func labelsSetup() {
        // translatesAutoresizingMaskIntoConstraints: Instance method of parent class UIView.
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.red
        label1.text = "  THESE"
        // sizeToFit(): Instance method of parent class UIView.
        label1.sizeToFit()
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "  ARE"
        label2.sizeToFit()
        
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "  SOME"
        label3.sizeToFit()
        
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "  AWESOME"
        label4.sizeToFit()
        
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "  LABELS"
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
    
    
    // D30-06-Add_horizontal_constraints
    private func addHorizontalConstarints() {
        for label in viewsDictionary.keys {
            view.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "H:|[\(label)]|",
                    options: [],
                    metrics: nil,
                    views: viewsDictionary)
            )
        }
    }
    
    
    // D30-06-Add_vertical_constraints
    private func addVerticalConstraints() {
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]",
                options: [],
                metrics: nil,
                views: viewsDictionary
            )
        )
    }
    
    
    // D31-01-Add_vertical_constraints_with_height_sizes
    private func addVerticalContraintsWithHeightSizes() {
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat:           "V:|[label1(==88)]-[label2(==88)]-[label3(==88)]-[label4(==88)]-[label5(==88)]-(>=10)-|",
                options: [],
                metrics: nil,
                views: viewsDictionary
            )
        )
    }
    
    
    // D31-02-Add_vertical_constraints_with_metrics
    private func addVerticalConstraintsWithMetrics() {
        let metrics = ["labelHeight": 88]
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[label1(labelHeight)]-[label2(labelHeight)]-[label3(labelHeight)]-[label4(labelHeight)]-[label5(labelHeight)]->=10-|",
                options: [],
                metrics: metrics,
                views: viewsDictionary
            )
        )
    }
    
    
    // D31-03-Add_vertical_constraints_with_metrics_and_constraint_priority
    private func addVerticalConstraintsWithMetricsAndPriority() {
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
    
    
    // Code D31-04-Add_Horizontal_and_vertical_constraints_with_anchors
    private func addConstraintsWithAnchors() {
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            
            if let previous = previous {
                // we have a previous label – create a height constraint
                label.topAnchor.constraint(
                    equalTo: previous.bottomAnchor, constant: 10).isActive = true
            }
            
            // set the previous label to be the current one, for the next loop iteration
            previous = label
        }
    }
    
    
    // D31-05-Add_constraints_with_anchors_within_safe_area
    private func addConstraintsWithAnchorsWithinSafeArea() {
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            label.widthAnchor.constraint(
                equalTo: view.widthAnchor).isActive = true
            
            label.heightAnchor.constraint(
                equalToConstant: 88).isActive = true
            
            if let previous = previous {
                // we have a previous label – create a height constraint
                label.topAnchor.constraint(
                    equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                // this is the first label
                label.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 0).isActive = true
            }
            
            // set the previous label to be the current one, for the next loop iteration
            previous = label
        }
    }
    
    
    // D31-C1..3-Add_constraints_with_leading_and_trailing_anchors_within_safe_area
    private func addConstraintsWithLeadingAndTrailingAnchorsWithinSafeArea() {
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            label.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 0).isActive = true
            
            label.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: 0).isActive = true
            
//            label.heightAnchor.constraint(
//                equalToConstant: 88).isActive = true
            
            label.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.2,
                constant: -10).isActive = true
            
            
            if let previous = previous {
                // we have a previous label – create a height constraint
                label.topAnchor.constraint(
                    equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                // this is the first label
                label.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 5).isActive = true
            }
            
            // set the previous label to be the current one, for the next loop iteration
            previous = label
        }
    }
    
}

