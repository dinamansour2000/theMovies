//
//  UIViewExtension.swift


import UIKit
import Cartography

public extension UIView {
    
    public func searchBarViewConstraintsLayout(parent: UIView, centerParent: UIImageView) {
        constrain(self, parent, centerParent) { searchBar, parent, centerParent in
            searchBar.top == parent.top + 7.5
            searchBar.left == parent.left + getPadding()
            searchBar.centerX == centerParent.centerX
            searchBar.width == searchBar.superview!.width - getPadding() * 2
            searchBar.height == 28
        }
    }
    
    private func getPadding(value: CGFloat = 10) -> CGFloat {
        return (Utils.isIPhone() ? value : value * 2)
    }
    
    public func searchBarViewStyle() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    
    func emptyContainerConstraintsLayout() {
        constrain(self) { container in
            container.top == container.superview!.centerY - (Utils.isIPhone() ? 60 : 120)
            container.centerX == container.superview!.centerX
        }
    }
    
    func emptyStateViewConstraintsLayout() {
        constrain(self) { emptyStateView in
            emptyStateView.top == emptyStateView.superview!.top  - 44
            emptyStateView.right == emptyStateView.superview!.right
            emptyStateView.left == emptyStateView.superview!.left
            emptyStateView.bottom == emptyStateView.superview!.bottom
        }
    }
    
    func eventDetailsImageAndTitleContainerLayoutConstrains() {
        constrain(self) { container in
            container.width == container.superview!.width
            //container.height == (EventUtils.isIPhone() ? 304 : 488)
            container.height == (container.superview!.width / 5) * 4
            container.left == container.superview!.left
        }
    }
    
    
    
    func fillScreenLayoutConstrains() {
        constrain(self) { view in
            view.edges == view.superview!.edges
        }
    }
    
    func centerXYLayoutConstrains() {
        constrain(self) { view in
            view.center == view.superview!.center
        }
    }
    
    
    
    
    
    func myScheduleLoadingFillScreenLayoutConstrains() {
        constrain(self) { view in
            view.edges == view.superview!.edges
        }
    }
    
    public func myScheduleExamCellSeparatorConstraint () {
        constrain(self){ separator in
            separator.left   == (separator.superview?.left)!
            separator.centerY == (separator.superview?.centerY)!
            separator.width  == (separator.superview?.width)!
            separator.height == 0.5
        }
    }
    
    public func myScheduleCellTopViewConstraint () {
        constrain(self){ separator in
            separator.left   == (separator.superview?.left)!
            separator.top == (separator.superview?.top)!
            separator.width  == (separator.superview?.width)!
            separator.height == (separator.superview?.height)! / 3
        }
    }
    
    public func myScheduleCellSeparatorConstraint () {
        constrain(self){ separator in
            separator.left   == (separator.superview?.left)!
            separator.bottom == (separator.superview?.bottom)!
            separator.width  == (separator.superview?.width)!
            separator.height == 0.5
        }
    }
    
    
    public func myScheduleCellGerayViewConstraint () {
        constrain(self){ separator in
            separator.left   == (separator.superview?.left)!
            separator.bottom == (separator.superview?.bottom)!
            separator.width  == (separator.superview?.width)!
            separator.height == (separator.superview?.height)! / 3
        }
    }
    
    
    public func myScheduleCellFirstSeparatorConstraint (separatorPadding: CGFloat) {
        constrain(self){ separator in
            separator.left  ==  (separator.superview?.left)! + separatorPadding
            separator.top == (separator.superview?.top)!
            separator.width  == 0.5
            separator.height == (separator.superview?.height)!
        }
    }
    
    
    public func myScheduleCellSecondSeparatorConstraint (separatorPadding: CGFloat) {
        constrain(self){ separator in
            separator.right  ==  (separator.superview?.right)! - separatorPadding
            separator.top == (separator.superview?.top)!
            separator.width  == 0.5
            separator.height == (separator.superview?.height)!
        }
    }
    
    
    func myscheduleMatchParentConstraintsLayout(parent: UIView) {
        constrain(self, parent) { view, parent in
            view.edges == parent.edges
        }
    }
    
    
    func myScheduleContainerViewConstraintsLayout(topParent: UISegmentedControl) {
        constrain(self, topParent) { view, topParent in
            view.left == view.superview!.left
            view.right == view.superview!.right
            view.top == topParent.bottom + CGFloat (Utils.isIPhone() ? 10 : 35)
            view.bottom == view.superview!.bottom
        }
    }
    
    public func myScheduleEmptyViewConstraint () {
        constrain(self){ emptyView in
            emptyView.top  == emptyView.superview!.top
            emptyView.left == emptyView.superview!.left
            emptyView.width == emptyView.superview!.width
            emptyView.height == emptyView.superview!.height
        }
    }
    
}
