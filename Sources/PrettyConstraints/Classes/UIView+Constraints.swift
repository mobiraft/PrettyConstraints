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

    func fitInSuperview(insets: CGFloat = 0, relativeToSafeArea: Bool = false) {
        guard let superView = self.superview else { return }
        fitInView(superView, insets: insets, relativeToSafeArea: relativeToSafeArea)
    }
    
    func fitInView(_ view: UIView, insets: CGFloat = 0, relativeToSafeArea: Bool = false) {
        if relativeToSafeArea {
            let view = view.safeAreaLayoutGuide
            self.applyConstraints(.top(to: view.topAnchor, constant: insets),
                                  .leading(to: view.leadingAnchor, constant: insets),
                                  .trailing(to: view.trailingAnchor, constant: -insets),
                                  .bottom(to: view.bottomAnchor, constant: -insets))
        } else {
            self.applyConstraints(.top(to: view.topAnchor, constant: insets),
                                  .leading(to: view.leadingAnchor, constant: insets),
                                  .trailing(to: view.trailingAnchor, constant: -insets),
                                  .bottom(to: view.bottomAnchor, constant: -insets))
        }
    }
    
    enum StackViewConfiguration {
        case axis(_ axis: NSLayoutConstraint.Axis)
        case alignment(_ alignment: UIStackView.Alignment)
        case spacing(_ spacing: CGFloat, after: UIView? = nil)
        case distribution(_ distribution: UIStackView.Distribution)
    }
    
    @discardableResult
    func addStackView(with views: [UIView], configs: [StackViewConfiguration] = [], insets: CGFloat = 0) -> UIStackView {
        let stackView = StackView(with: views, configs: configs)
        self.addSubview(stackView)
        stackView.fitInView(self, insets: insets)
        return stackView
    }
    
    @discardableResult
    func addScrollView(with view: UIView, direction: NSLayoutConstraint.Axis, insets: CGFloat = 0) -> UIScrollView {
        let scrollView = ScrollView(with: view, direction: direction)
        self.addSubview(scrollView)
        scrollView.fitInView(self, insets: insets)
        return scrollView
    }
    
}

public func StackView(with views: [UIView], configs: [UIView.StackViewConfiguration] = []) -> UIStackView {
    let stackView = UIStackView.init()
    
    for config in configs {
        switch config {
        case .alignment(let alignment):
            stackView.alignment = alignment
        case .axis(let axis):
            stackView.axis = axis
        case .spacing(let spacing, let afterView):
            if let afterView = afterView {
                stackView.setCustomSpacing(spacing, after: afterView)
            } else {
                stackView.spacing = spacing
            }
        case .distribution(let distribution):
            stackView.distribution = distribution
        }
    }
    
    for view in views {
        stackView.addArrangedSubview(view)
    }
    
    return stackView
}

public func ScrollView(with view: UIView, direction: NSLayoutConstraint.Axis) -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.addSubview(view)
    view.fitInView(scrollView)
    
    if direction == .horizontal {
        view.applyConstraints(.height(to: scrollView.heightAnchor),
                              .centerY(to: scrollView.centerYAnchor))
    } else {
        view.applyConstraints(.width(to: scrollView.widthAnchor),
                              .centerX(to: scrollView.centerXAnchor))
    }
    
    return scrollView
}

#endif
