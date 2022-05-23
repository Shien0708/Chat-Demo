//
//  ChattingTableViewController.swift
//  Chat Demo
//
//  Created by Shien on 2022/5/20.
//

import UIKit

class ChattingTableViewController: UITableViewController {
    
    static private var reuseIdentifier = "\(ChattingTableViewCell.self)"
    
    @IBOutlet weak var inputTextField: UITextField!
    
    let lines2 = [
        "Hi 😀",
        "I am a man.",
        "I am 25 years old now. Though I am not really old as a human, but I don't really enjoy everyday stuff.",
        "On weekday, I will sometimes go out to search a place and settle down to do my homework. There's only one dog at home if I go out.",
        "While doing my home working, I sometimes miss my dog because she is so cute. Her existence does make me calm and happy!"]
    
    let lines = [
        "Hello, everyone my name is Wuang Ji.",
        "I am a dachshund.",
        "I am 10 years old now. Though I am not really young as a dog, but I enjoy everyday being with my family!",
        "On weekday, all of my family members need to go to work or go to school. There's nobody at home excecpt me most of the time.",
        "While waiting for them to come home, I like to lie in my favorite place which is under the table. The place make me safe, feels like no one can beat me up when I am there."]
    var currentLine = 0
    var isdog = true
    var sendingMessage = ""
    var messageCounts = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        makeToolBar()
    }
    
    func makeToolBar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        inputTextField.inputAccessoryView = toolBar
    }
   
    @objc private func didTapDone() {
        inputTextField.resignFirstResponder()
        sendingMessage = inputTextField.text ?? ""
        inputTextField.text = ""
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isdog {
            ChattingTableViewController.reuseIdentifier = "\(ChattingTableViewCell.self)"
        } else {
            ChattingTableViewController.reuseIdentifier = "Chatting2TableViewCell"
        }
        
        messageCounts += 1
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChattingTableViewController.reuseIdentifier, for: indexPath) as? ChattingTableViewCell else { return ChattingTableViewCell() }
        
        if isdog {
            cell.updateDog()
            cell.bubbleTextView.text = sendingMessage
        } else {
            cell.updateMan()
            cell.bubble2TextView.text = sendingMessage
        }
        
        guard isdog else {
            if currentLine < lines.count {
                currentLine += 1
            } else {
                currentLine = 0
            }
            isdog = true
            return cell
        }
        isdog = false
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
