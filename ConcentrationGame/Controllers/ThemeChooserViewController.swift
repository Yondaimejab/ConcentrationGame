//
//  ThemeChooserViewController.swift
//  ConcentrationGame
//
//  Created by Joel Alcantara on 3/3/20.
//  Copyright © 2020 JoelsTeam. All rights reserved.
//

import Foundation
import UIKit

class ThemeChooserViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var themesStackView: UIStackView!
    
    private var viewModel: ConcentrationGameViewModel = ConcentrationGameViewModel()
    private var selectedThemeName: String?
    private var concentrationViewController : HomeViewController? {
        return splitViewController?.viewControllers.last as? HomeViewController
    }
    private var concentrationGameViewController: HomeViewController?
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    override func viewDidLoad() {
        for item in viewModel.getThemes() {
            let button = UIButton()
            button.setTitle(item, for: .normal)
            button.backgroundColor = .black
            themesStackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(onbuttonClicked(button:)), for: .touchUpInside)
        }
    }
    
    @objc
    func onbuttonClicked(button: UIButton) {
        if let _ = button.currentTitle {
            selectedThemeName = button.currentTitle!
            if concentrationViewController != nil {
                concentrationViewController!.themeName = selectedThemeName
                navigationController?.pushViewController(concentrationViewController!, animated: true)
            } else if concentrationGameViewController != nil {
                concentrationGameViewController?.themeName = selectedThemeName
                navigationController?.pushViewController(concentrationGameViewController!, animated: true)
            } else {
                performSegue(withIdentifier: "Show Concentration Game", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO "Show Concentration Game"
        if let destination = segue.destination as? HomeViewController {
            destination.themeName = selectedThemeName
            concentrationGameViewController = destination
        }
    }
}

extension ThemeChooserViewController : UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? HomeViewController {
            if cvc.themeName == nil {
                return true
            }else {
                return false
            }
        } else {
            return false
        }
    }
}
