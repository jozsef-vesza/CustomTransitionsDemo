//
//  MainViewController.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

let showDetailSegueId = "showDetailSegue"
let aboutSegueId = "showAbout"

class MainViewController: UITableViewController {

    var viewModel: MainViewModel!
    
    private let bounceAnimationController = BounceAnimationController()
    private let shrinkDismissAnimationController = ShrinkDismissAnimationController()
    private let flipAnimationController = FlipAnimationController()
    private let swipeInteractionController = SwipeInteractionController()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.delegate = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == showDetailSegueId,
            let sender = sender as? NSIndexPath,
            let destination = segue.destinationViewController as? DetailViewController {
        
                let detailViewModel = DetailViewModel(photoStore: viewModel.photoStore, selectedIndex: sender.row)
                destination.viewModel = detailViewModel
        }
        
        if segue.identifier == aboutSegueId, let destination = segue.destinationViewController as? AboutViewController {
            
            let aboutViewModel = AboutViewModel(authorStore: AuthorStore.sharedInstance)
            
            destination.viewModel = aboutViewModel
            
            destination.transitioningDelegate = self
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! ExampleCell
        
        cell.mainTitle = viewModel.titleForRow(indexPath.row)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(showDetailSegueId, sender: indexPath)
    }
    
    // MARK: - User interaction
    
    @IBAction private func aboutPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier(aboutSegueId, sender: nil)
    }
}

// MARK: - View controller transitioning delegate

extension MainViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return bounceAnimationController
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return shrinkDismissAnimationController
    }
}

// MARK: - Navigation controller delegate

extension MainViewController: UINavigationControllerDelegate {

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .Push {
            swipeInteractionController.wireToViewController(toVC)
        }
        
        flipAnimationController.reverse = operation == .Pop
        return flipAnimationController
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return swipeInteractionController.interactionInProgress ? swipeInteractionController : nil
    }
}