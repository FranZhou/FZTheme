//
//  ViewController.swift
//  FZTheme
//
//  Created by FranZhou on 09/09/2020.
//  Copyright (c) 2020 FranZhou. All rights reserved.
//

import UIKit
import FZBuildingBlock
import FZTheme

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        FZThemeConfiguration.defaultThemeStyle = .dark

        // Do any additional setup after loading the view.
        FZThemeManager.manager.themeLoader { (style) -> (Bool, FZThemeMachineProtocol?)? in
            print("\(style.themeName)")

            return (true, DemoThemeMachine(themeStyle: style))
        }

        self.view.fz_theme.appearance { (view, style, themeMachine) in
            view.layer.contents = themeMachine?.themeImage(withIdentifier: "backgroundImage", themeStyle: style, defaultImage: nil)?.cgImage
        }

        setupUI()
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

extension ViewController {

    func setupUI() {

        do {
            let btn = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 50))
            btn.setTitle("light", for: UIControl.State.normal)
            btn.fz_theme.appearance { (btn, style, themeMachine) in
                btn.setTitleColor(themeMachine?.themeColor(withIdentifier: "btn_titile", themeStyle: style, defaultColor: UIColor.fz.randomColor()), for: UIControl.State.normal)
                btn.backgroundColor = themeMachine?.themeColor(withIdentifier: "btn_background", themeStyle: style, defaultColor: UIColor.fz.randomColor())
            }

            btn.fz.addHandler(closure: { (_) in
                FZThemeManager.manager.switchCurrentTheme(to: .light)
            }, for: UIControl.Event.touchUpInside)
            self.view.addSubview(btn)
        }

        do {
            let btn = UIButton(frame: CGRect(x: 140, y: 100, width: 100, height: 50))
            btn.setTitle("dark", for: UIControl.State.normal)
            btn.fz_theme.appearance { (btn, style, themeMachine) in
                btn.setTitleColor(themeMachine?.themeColor(withIdentifier: "btn_titile", themeStyle: style, defaultColor: UIColor.fz.randomColor()), for: UIControl.State.normal)
                btn.backgroundColor = themeMachine?.themeColor(withIdentifier: "btn_background", themeStyle: style, defaultColor: UIColor.fz.randomColor())
            }

            btn.fz.addHandler(closure: { (_) in
                FZThemeManager.manager.switchCurrentTheme(to: .dark)
            }, for: UIControl.Event.touchUpInside)
            self.view.addSubview(btn)
        }

        do {
            let btn = UIButton(frame: CGRect(x: 260, y: 100, width: 100, height: 50))
            btn.setTitle("custom", for: UIControl.State.normal)
            btn.fz_theme.appearance { (btn, style, themeMachine) in
                btn.setTitleColor(themeMachine?.themeColor(withIdentifier: "btn_titile", themeStyle: style, defaultColor: UIColor.fz.randomColor()), for: UIControl.State.normal)
                btn.backgroundColor = themeMachine?.themeColor(withIdentifier: "btn_background", themeStyle: style, defaultColor: UIColor.fz.randomColor())
            }

            btn.fz.addHandler(closure: { (_) in
                FZThemeManager.manager.switchCurrentTheme(to: .custom("test1"))
            }, for: UIControl.Event.touchUpInside)
            self.view.addSubview(btn)
        }

    }

}
