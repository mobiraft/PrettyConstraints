//
//  Constraints.swift
//  PrettyConstraints
//
//  Created by Hardik Parmar on 30/10/20.
//

import UIKit

public enum Constraints {
    case top(to: NSLayoutYAxisAnchor, constant: CGFloat = 0, equality: NSLayoutConstraint.Relation = .equal)
    case bottom(to: NSLayoutYAxisAnchor, constant: CGFloat = 0, equality: NSLayoutConstraint.Relation = .equal)
    case leading(to: NSLayoutXAxisAnchor, constant: CGFloat = 0, equality: NSLayoutConstraint.Relation = .equal)
    case trailing(to: NSLayoutXAxisAnchor, constant: CGFloat = 0, equality: NSLayoutConstraint.Relation = .equal)
    case width(to: NSLayoutDimension? = nil, constant: CGFloat, equality: NSLayoutConstraint.Relation = .equal)
    case height(to: NSLayoutDimension? = nil, constant: CGFloat, equality: NSLayoutConstraint.Relation = .equal)
    case centerX(to: NSLayoutXAxisAnchor, constant: CGFloat = 0, equality: NSLayoutConstraint.Relation = .equal)
    case centerY(to: NSLayoutYAxisAnchor, constant: CGFloat = 0, equality: NSLayoutConstraint.Relation = .equal)
    case fitInView(_ view: UIView, inset: CGFloat = 0)
    case fitInSafeArea(_ safeArea: UILayoutGuide, inset: CGFloat = 0)
    case center(in: UIView)
}
