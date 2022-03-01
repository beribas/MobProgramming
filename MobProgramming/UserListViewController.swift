//
//  UserListViewController.swift
//  MobProgramming
//
//  Created by Oleg Langer on 01.03.22.
//

import UIKit

protocol UserListView: AnyObject {
    func updateView()
}

class UserCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class UserListViewController: UITableViewController {
    private let presenter: UserListPresenter

    init(presenter: UserListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UserCell.self, forCellReuseIdentifier: String(describing: UserCell.self))
        presenter.view = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: UserCell.self),
            for: indexPath) as? UserCell
        else {
            fatalError()
        }
        let userListModel = presenter.cellModel(at: indexPath.row)
        // cell.configure(config: cellConfig)
        cell.textLabel?.text = userListModel.name
        cell.detailTextLabel?.text = userListModel.email
        return cell
    }
}

extension UserListViewController: UserListView {
    func updateView() {
        tableView.reloadData()
    }
}
