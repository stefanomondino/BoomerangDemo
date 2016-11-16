//
//  BoomerangDemoTests.swift
//  BoomerangDemoTests
//
//  Created by Stefano Mondino on 11/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Gloss
@testable import BoomerangDemo

class ShowSpec: QuickSpec {
    override func spec() {
        describe ("a Movie") {
            var show:Show!
            context(" when initialized") {
                beforeEach {
                    show = try! Show(json: JSONSerialization.jsonObject(with:TVMaze.detail(identifier: "").sampleData ) as! JSON)
                }
                
                it (" should always have a name") {
                    expect(show.title).to(equal("Girls"))
                }
                it (" should have an ID") {
                    expect(show.id).notTo(beNil())
                    expect(show.id).to(equal(139))
                }
            }
        }
    }
}
