//
//  ChatViewController.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.datechnologies.co/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
    private var client: ChatClient?
    private var messages = [MessageModel]()
    let cellSpacingHeight: CGFloat = CONSTANTS.CELL_SPACING_HEIGHT
    let initialSpacingHeight: CGFloat = CONSTANTS.INITIAL_SPACING_HEIGHT
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Text.Chat.description
        configureTable(tableView: chatTable)
        getMessages()
    }
    
    private func getMessages() {
        showActivityIndicator(activityIndicator: activityIndicator)
        DAO.instance.getMessages { [weak self] response, error, requestDuration in
            guard let self = self else { return }
            self.stopActivityIndicator(activityIndicator: self.activityIndicator)
            if error == nil {
                if let messages = response?.data {
                    self.messages = messages
                    self.chatTable.reloadData()
                }
            } else {
                self.showToast(message: Text.ServerError.description, width: CONSTANTS.TOAST_SIZE)
            }
        }
    }
    
  //   MARK: - Private
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ChatTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ChatTableViewCell.nibName)
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = CONSTANTS.ESTIMATED_ROW_HEIGTH
    }
    
 // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ChatTableViewCell? = nil
        if cell == nil {
            let nibs = Bundle.main.loadNibNamed(ChatTableViewCell.nibName, owner: self, options: nil)
            cell = nibs?[0] as? ChatTableViewCell
        }
        cell?.setCellData(message: messages[indexPath.section])
        return cell!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    

 // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return initialSpacingHeight
        } else {
            return cellSpacingHeight
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.groupTableViewBackground
        return headerView
    }
    
    
    
}
