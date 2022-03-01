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

        presenter.view = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue cell
        let cellConfig = presenter.cellConfig(at: indexPath.row)
        // cell.configure(config: cellConfig)
    }
}

extension UserListViewController: UserListView {
    func updateView() {
        tableView.reloadData()
    }
}
