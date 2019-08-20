//
//  DGLogUnitTests.swift
//  DGLog-iOS-Unit-Tests
//
//  Created by horing on 14/08/2019.
//

import XCTest
@testable import DGLog

class DGLogUnitTests: XCTestCase {

    override func setUp() {
        DGLogConfig.isVisible = true
        DGLogConfig.isVisibleDate = true
        DGLogConfig.isVisibleFile = true
        DGLogConfig.isVisibleFunction = true
        DGLogConfig.isVisibleLine = true
        DGLogConfig.isVisibleMessage = true
        DGLogConfig.dateFormatter = {
            let result = DateFormatter()
            let calender = Calendar.current
            result.dateStyle = .short
            result.timeStyle = .medium
            result.locale = calender.locale
            return result
        }()
    }

    override func tearDown() {
        
    }

    func testExample() {
        DGLog()
    }

    func testPerformanceExample() {
        self.measure {
            DGLog()
        }
    }
}
