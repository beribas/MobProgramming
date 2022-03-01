//
//  UserListPresenter.swift
//  MobProgramming
//
//  Created by Martin List on 01.03.22.
//

import Foundation

final class UserListPresenter {

    struct UserListCellModel {
        let name: String
        let email: String
        let avatarURL: URL?

        static func create(from user: User) -> UserListCellModel {
            return UserListCellModel(
                name: user.first_name + " " + user.last_name,
                email: user.email,
                avatarURL: URL(string: user.avatar)
            )
        }
    }

    var numberOfSections: Int { 1 }

    var numberOfRows: Int { userModels.count }

    weak var view: UserListView? {
        didSet {
            getUsers()
        }
    }

    private var userModels: [UserListCellModel] = []

    private func getUsers() {
        fetchUsers { [weak self] response in

            self?.userModels = response.data.map(UserListCellModel.create(from:))
            DispatchQueue.main.async {
                self?.view?.updateView()
            }
        }
    }

    func cellModel(at index: Int) -> UserListCellModel {
        userModels[index]
    }
}
