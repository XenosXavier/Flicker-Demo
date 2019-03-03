//
//  SearchViewController.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import UIKit
import PromiseKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var numberPerPageTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    private let viewModel = SearchViewModel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "搜尋輸入頁"
        self.searchButton.tintColor = UIColor.white
        self.searchTextField.delegate = self
        self.numberPerPageTextField.delegate = self
        updateButtonStatus()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        if let textField = sender as? UITextField,
            let id = textField.accessibilityIdentifier,
            let text = textField.text {
            viewModel.updateState(byTextFieldId: id, andText: text)
            updateButtonStatus()
        }
    }
    
    @IBAction func searchButtonDidClick(_ sender: Any) {
        viewModel.searchPhoto()
        self.navigationController?.pushViewController(ImageTabBarController(), animated: true)
    }
    
    private func updateButtonStatus() {
        searchButton.isEnabled = viewModel.isButtonEnabled
        searchButton.backgroundColor = UIColorExtension.getColor(fromHex: viewModel.getButtonColor())
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return viewModel.isValidString(id: textField.accessibilityIdentifier, text: textField.text, replacementRange: range, replacementString: string)
    }
}
