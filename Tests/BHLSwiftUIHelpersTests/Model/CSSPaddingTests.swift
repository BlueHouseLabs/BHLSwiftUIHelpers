//
//  CSSPaddingTests.swift
//  
//
//  Created by Eric DeLabar on 12/31/22.
//

import XCTest
@testable import BHLSwiftUIHelpers

final class CSSPaddingTests: XCTestCase {
    
    func testEmptyInput() throws {
        
        let input: [CGFloat] = []
        
        let cut = CSSPadding(input)
        
        XCTAssertEqual(cut, CSSPadding(
            top: nil,
            trailing: nil,
            bottom: nil,
            leading: nil
        ))
    }
    
    func testAllDefault() throws {
        
        let input: [CGFloat] = [.defaultPadding, .defaultPadding, .defaultPadding, .defaultPadding]
        
        let cut = CSSPadding(input)
        
        XCTAssertEqual(cut, CSSPadding(
            top: nil,
            trailing: nil,
            bottom: nil,
            leading: nil
        ))
    }

    func testAllSame() throws {
        
        let input: [CGFloat] = [10]
        
        let cut = CSSPadding(input)
        
        XCTAssertEqual(cut, CSSPadding(
            top: 10,
            trailing: 10,
            bottom: 10,
            leading: 10
        ))
    }
    
    func testVerticalHorizontal() throws {
        
        let input: [CGFloat] = [10, 20]
        
        let cut = CSSPadding(input)
        
        XCTAssertEqual(cut, CSSPadding(
            top: 10,
            trailing: 20,
            bottom: 10,
            leading: 20
        ))
    }
    
    func testTopHorizontalBottom() throws {
        
        let input: [CGFloat] = [5, 20, 10]
        
        let cut = CSSPadding(input)
        
        XCTAssertEqual(cut, CSSPadding(
            top: 5,
            trailing: 20,
            bottom: 10,
            leading: 20
        ))
    }
    
    func testAllUnique() throws {
        
        let input: [CGFloat] = [5, 10, 15, 20]
        
        let cut = CSSPadding(input)
        
        XCTAssertEqual(cut, CSSPadding(
            top: 5,
            trailing: 10,
            bottom: 15,
            leading: 20
        ))
    }
    
    func testDefaultPadding() throws {
        
        XCTAssertEqual(CSSPadding([.defaultPadding]).asArray, [nil, nil, nil, nil])
        XCTAssertEqual(CSSPadding([.defaultPadding, .defaultPadding]).asArray, [nil, nil, nil, nil])
        XCTAssertEqual(CSSPadding([.defaultPadding, .defaultPadding, .defaultPadding]).asArray, [nil, nil, nil, nil])
        XCTAssertEqual(CSSPadding([.defaultPadding, .defaultPadding, .defaultPadding, .defaultPadding]).asArray, [nil, nil, nil, nil])
        XCTAssertEqual(CSSPadding([10, .defaultPadding]).asArray, [10, nil, 10, nil])
        XCTAssertEqual(CSSPadding([.defaultPadding, 10]).asArray, [nil, 10, nil, 10])
        XCTAssertEqual(CSSPadding([5, .defaultPadding, 10]).asArray, [5, nil, 10, nil])
        XCTAssertEqual(CSSPadding([.defaultPadding, 5, .defaultPadding, 10]).asArray, [nil, 5, nil, 10])
        
    }
    
    func testArrayLiteral() throws {
        
        let cut: CSSPadding = [10, 15]
        
        XCTAssertEqual(cut.asArray, [10, 15, 10, 15])
        
    }

}

extension CSSPadding {
    var asArray: [CGFloat?] {
        [top, trailing, bottom, leading]
    }
}
