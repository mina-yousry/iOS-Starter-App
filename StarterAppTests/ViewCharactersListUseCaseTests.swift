//
//  ViewCharactersListUseCaseTests.swift
//  StarterAppTests
//
//  Created by Mina Yousry on 11/01/2023.
//

import XCTest
import RxSwift
import SwiftyMocky
@testable import StarterApp

final class ViewCharactersListUseCaseTests: XCTestCase {
    
    var disposeBag: DisposeBag!
    
    override class func setUp() {
    }
    
    override func setUpWithError() throws {
        self.disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        self.disposeBag = nil
    }

    func testGetCharactersList() throws {
        //given
        let useCase = ViewCharactersListUseCase()
        let expectation = self.expectation(description: "expecting characters response")
        var testEntity: MarverCharactersResponseEntity?
        //when
        useCase.getCharactersList(disposeBag: disposeBag).subscribe { entity in
            testEntity = entity
            expectation.fulfill()
        }.disposed(by: disposeBag)
        wait(for: [expectation], timeout: 2.0)
        //then
        let firstCharacterName = testEntity?.data?.results?.first?.name ?? ""
        checkCharacters(firstName: firstCharacterName,name: "3-d man")
    }
    
    func checkCharacters(firstName: String, name: String,
                         line: UInt = #line,
                         file: StaticString = #file) {
        XCTAssertEqual(firstName.lowercased(), name, file: file, line: line)
    }
    
    func testGetCharactersListFirstCh() throws {
        let useCase = ViewCharactersListUseCase()
        let expectation = self.expectation(description: "expecting characters response")
        var testEntity: MarverCharactersResponseEntity?
        useCase.getCharactersList(disposeBag: disposeBag).subscribe { entity in
            testEntity = entity
            expectation.fulfill()
        }.disposed(by: disposeBag)
        wait(for: [expectation], timeout: 5.0)
        let firstCharacterName = testEntity?.data?.results?.first?.name ?? ""
        XCTAssertEqual(firstCharacterName.lowercased(), "3-d man")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
