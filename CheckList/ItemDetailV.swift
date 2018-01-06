//
//  itemDetailViewController.swift
//  CheckList
//
//  Created by Nyi Nyi Zaw on 12/29/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import UIKit


protocol ItemDetailViewControllerDelegate : class {
    
    func itemDetailViewControllerDidCancel(_ controller : ItemDetailV)
    func itemDetailViewController(_ controller : ItemDetailV , didFinishAdding item : ChecklistItem)
    func itemDetailViewController(_ controller : ItemDetailV , didFinishEditing item : ChecklistItem)
    
}

class ItemDetailV: UITableViewController,UITextFieldDelegate {

    @IBOutlet weak var doneBarButtton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    var itemToEdit : ChecklistItem?
    
    
    weak var delegate : ItemDetailViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButtton.isEnabled = true
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    @IBAction func cancel()
    {
        navigationController?.popViewController(animated: true)
        delegate?.itemDetailViewControllerDidCancel(self)
        
    }
    
    @IBAction func done()
    {
        if let itemToEdit = itemToEdit {
            itemToEdit.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditing: itemToEdit)
        }else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
       
        
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range,in:oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)

        if newText.isEmpty {
            doneBarButtton.isEnabled = false
        }else {
            doneBarButtton.isEnabled = true
        }
        return true
    }
}
