//
//  ViewController.swift
//  TEST-StreamReader
//
//  Created by leanne on 10/29/17.
//  Copyright © 2017 A Software Company, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "StreamTestFile", ofType: "txt") else {
            print("Dang! File wasn't found!")
            return
        }
        guard let streamReader = StreamReader(path: path) else {
            print("Dang! StreamReader couldn't be created!")
            return
        }
        var counter = 0
        while !streamReader.atEof {
            guard let nextLine = streamReader.nextLine() else {
                print("Oops! Reached the end before printing!")
                break
            }
            counter += 1
            print("\(counter): \(nextLine)")
        }
        streamReader.rewind()
        for i in 0..<2 {
            guard let line = streamReader.nextLine() else {
                print("Out of lines!")
                break
            }
            if i == 1 {
                print("This is the line I was looking for:\n\(line)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

