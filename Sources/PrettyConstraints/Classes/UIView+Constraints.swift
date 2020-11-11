//
//  UIView+Constraints.swift
//  PrettyConstraints
//
//  Created by Hardik Parmar on 30/10/20.
//

#if canImport(UIKit)

import UIKit

public extension UIView {
    
    @discardableResult
    func applyConstraints(_ constraints: Constraints...) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var appliedConstraints:[NSLayoutConstraint] = []
        for constraint in constraints {
            var appliedConstraint:NSLayoutConstraint?
            switch constraint {
            case .top(let anchor, let constant, let equality):
                appliedConstraint = setConstraint(anchor: topAnchor, toAnchor: anchor, equality: equality, constant: constant)
            case .bottom(let anchor, let constant, let equality):
                appliedConstraint = setConstraint(anchor: bottomAnchor, toAnchor: anchor, equality: equality, constant: constant)
            case .leading(let anchor, let constant, let equality):
                appliedConstraint = setConstraint(anchor: leadingAnchor, toAnchor: anchor, equality: equality, constant: constant)
            case .trailing(let anchor, let constant, let equality):
                appliedConstraint = setConstraint(anchor: trailingAnchor, toAnchor: anchor, equality: equality, constant: constant)
            case .width(let anchor, let constant, let equality):
                appliedConstraint = setSizeConstraint(anchor: widthAnchor, toAnchor: anchor, equality: equality, constant: constant)
            case .height(let anchor, let constant, let equality):
                appliedConstraint = setSizeConstraint(anchor: heightAnchor, toAnchor: anchor, equality: equality, constant: constant)
            case .centerX(let anchor, let constant, let equality):
                appliedConstraint = setConstraint(anchor: centerXAnchor, toAnchor: anchor, equality: equality, constant: constant)
            case .centerY(let anchor, let constant, let equality):
                appliedConstraint = setConstraint(anchor: centerYAnchor, toAnchor: anchor, equality: equality, constant: constant)
            case .fitInView(let view, let constant):
                let internalConstraints = self.applyConstraints(.top(to: view.topAnchor, constant: constant),
                                                                .leading(to: view.leadingAnchor, constant: constant),
                                                                .trailing(to: view.trailingAnchor, constant: -constant),
                                                                .bottom(to: view.bottomAnchor, constant: -constant))
                appliedConstraints.append(contentsOf: internalConstraints)
            case .fitInSafeArea(let safeArea, let constant):
                let internalConstraints = self.applyConstraints(.top(to: safeArea.topAnchor, constant: constant),
                                                                .leading(to: safeArea.leadingAnchor, constant: constant),
                                                                .trailing(to: safeArea.trailingAnchor, constant: -constant),
                                                                .bottom(to: safeArea.bottomAnchor, constant: -constant))
                appliedConstraints.append(contentsOf: internalConstraints)
            case .center(let view):
                let internalConstraints = self.applyConstraints(.centerX(to: view.centerXAnchor),
                                                                .centerY(to: view.centerYAnchor))
                appliedConstraints.append(contentsOf: internalConstraints)
            }
            if let appliedConstraint = appliedConstraint {
                appliedConstraints.append(appliedConstraint)
            }
        }
        return appliedConstraints
    }
    
    @discardableResult
    func setConstraint<T>(anchor: NSLayoutAnchor<T>, toAnchor: NSLayoutAnchor<T>, equality: NSLayoutConstraint.Relation, constant: CGFloat) -> NSLayoutConstraint {
        var appliedConstraint:NSLayoutConstraint
        switch equality {
        case .lessThanOrEqual:
            appliedConstraint = anchor.constraint(lessThanOrEqualTo: toAnchor, constant: constant)
        case .greaterThanOrEqual:
            appliedConstraint = anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: constant)
        default:
            appliedConstraint = anchor.constraint(equalTo: toAnchor, constant: constant)
        }
        appliedConstraint.isActive = true
        return appliedConstraint
    }
    
    @discardableResult
    func setSizeConstraint(anchor: NSLayoutDimension, toAnchor: NSLayoutDimension?, equality: NSLayoutConstraint.Relation, constant: CGFloat) -> NSLayoutConstraint {
        var appliedConstraint:NSLayoutConstraint
        switch equality {
        case .lessThanOrEqual:
            if let toAnchor = toAnchor {
                appliedConstraint = anchor.constraint(lessThanOrEqualTo: toAnchor, constant: constant)
            } else {
                appliedConstraint = anchor.constraint(lessThanOrEqualToConstant: constant)
            }
        case .greaterThanOrEqual:
            if let toAnchor = toAnchor {
                appliedConstraint = anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: constant)
            } else {
                appliedConstraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        default:
            if let toAnchor = toAnchor {
                appliedConstraint = anchor.constraint(equalTo: toAnchor, constant: constant)
            } else {
                appliedConstraint = anchor.constraint(equalToConstant: constant)
            }
        }
        appliedConstraint.isActive = true
        return appliedConstraint
    }

}

#endif
