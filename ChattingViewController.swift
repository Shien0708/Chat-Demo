//
//  ChattingViewController.swift
//  Chat Demo
//
//  Created by Shien on 2022/5/20.
//

import UIKit
import Foundation


class ChattingViewController: UIViewController, UINavigationControllerDelegate {
    static private var reuseIdentifier = "\(ChattingTableViewCell.self)"
    @IBOutlet weak var chattingTableView: UITableView!
    
    //messages
    static var messages = [String]() //儲存聊天訊息
    var isMen = [Bool]() //紀錄對話的順序
    
    
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var inputTextView: UITextView!
    
    
    //keyboard
    @IBOutlet weak var inputStackViewTop: NSLayoutConstraint! //stack view 到 super view top 的 constraint
    @IBOutlet weak var inputStackViewBottom: NSLayoutConstraint! // stack view 到 super view bottom 的 constraint
    var keyboardSize: CGRect? //鍵盤高度
    var keyboardIsShowed = false //檢查鍵盤顯示狀態
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 鍵盤觀察器：鍵盤顯示時
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // 鍵盤觀察器：繼盤關閉時
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //輸入框樣式調整
        inputTextView.layer.borderWidth = 1
    }
    
    //Tap Gesture Recognizer
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
         keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        guard !keyboardIsShowed else {return}
        if let height = keyboardSize?.height {
            inputStackViewBottom.constant = height
        }
        keyboardIsShowed = true
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        inputStackViewBottom.constant = 44
        keyboardIsShowed = false
    }

    
    @IBAction func sendMessage(_ sender: Any) {
        for _ in 0...1 {
            ChattingViewController.messages.append(inputTextView.text)
        }
        inputTextView.text = ""
        isMen.append(true)
        isMen.append(false)
        chattingTableView.reloadData()
        view.endEditing(true)
    }
}


extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChattingViewController.messages.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isMen[indexPath.row] {
            ChattingViewController.reuseIdentifier = "MessageTableViewCell2"
        } else {
            ChattingViewController.reuseIdentifier = "\(MessageTableViewCell.self)"
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChattingViewController.reuseIdentifier, for: indexPath) as? MessageTableViewCell else { return MessageTableViewCell() }
        
        if isMen[indexPath.row] {
            cell.updateMan()
        } else {
            cell.updateDog()
        }
        
        guard !ChattingViewController.messages.isEmpty else {return cell}
        if isMen[indexPath.row] {
            cell.message2TextView.text = ChattingViewController.messages[indexPath.row]
        } else {
            cell.messageTextView.text = ChattingViewController.messages[indexPath.row]
        }
        return cell
    }
}
