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
                   // show = try! Show(json: JSONSerialization.jsonObject(with: Data.init(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Show", ofType: "json")!)), options: []) as! JSON)!
                    
                    show = try! Show(json: JSONSerialization.jsonObject(with:TVMaze.detail(identifier: "").sampleData ) as! JSON)
                }
                
                it (" should always have a name") {
                    expect(show.title).to(equal("Girls"))
                }
                it (" should map the id") {
                    expect(show.id).notTo(beNil())
                    expect(show.id).to(equal(139))
                }
            }
        }
    }
}
