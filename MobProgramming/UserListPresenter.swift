//
//  UserListPresenter.swift
//  MobProgramming
//
//  Created by Martin List on 01.03.22.
//

import UIKit

final class UserListPresenter {

    var numberOfSections: Int { 1 }

    var numberOfRows: Int { users.count }

    weak var view: UserListView? {
        didSet {
            getUsers()
        }
    }

    private var users: [User] = []

    func getUsers() {
        fetchUsers { [weak self] response in
            self?.users = response.data
            self?.view?.updateView()
        }
    }
}
