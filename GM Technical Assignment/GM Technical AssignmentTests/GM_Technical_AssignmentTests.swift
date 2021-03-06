//
//  GM_Technical_AssignmentTests.swift
//  GM Technical AssignmentTests
//
//  Created by Carlos Torres on 10/26/20.
//

import XCTest
@testable import GM_Technical_Assignment

class GM_Technical_AssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCommitService() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        CommitService.shared.getCommits { result in
            switch result {
            case .success(let commitInfoList):
                XCTAssert(!commitInfoList.isEmpty)
                for item in commitInfoList {
                    XCTAssert(!item.commit.author.name.isEmpty)
                    XCTAssert(!item.commit.message.isEmpty)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
