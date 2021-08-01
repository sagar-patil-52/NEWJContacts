//
//  NEWJContactsTests.swift
//  NEWJContactsTests
//
//  Created by mmt on 27/07/21.
//

import XCTest
@testable import NEWJContacts

class NEWJContactsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchingUserData() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let userVM = UsersViewModel()
        userVM.fetchUsers()
        let users = userVM.getUsers()
    
        XCTAssertNotNil(users)
        XCTAssertEqual(users.count, 10)
    }
    
    func testUserAPI() {
        
        let userAPIExpectation = expectation(description: "Users")
        var users = [User]()
        
        let apiHandler = APIHandler()
        apiHandler.getUsers(completionHandler: { [weak self] (data, error) -> (Void) in
                if let data = data as? [User] {
                    users = data
                    userAPIExpectation.fulfill()
            }
        })
        
        waitForExpectations(timeout: 2) { (error) in
           XCTAssertNotNil(users)
           XCTAssertTrue(users.count == 10)
        }
    }

    func testFavourite() {
        
        let userVM = UsersViewModel()
        userVM.fetchUsers()
        let users = userVM.getUsers()
        
        //The test case should fail when firstuser is nil
        if let firstUser = users.first {
            let userDetailVM = UserDetailViewModel(userId: Int(firstUser.id))
            userDetailVM.markUserFavourite()
            
            userVM.fetchUsers()
            let updatedUser = userDetailVM.fetchUser()
            XCTAssertEqual(updatedUser?.isFavourite, true)
            
        } else {
            XCTAssertNotNil(users.first)
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
