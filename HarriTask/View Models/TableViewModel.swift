//
//  TableViewModel.swift
//  HarriTask
//
//  Created by Harri on 10/16/19.
//  Copyright © 2019 Harri. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewModel {
    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func viewForFooterInSection(inSection section: Int) -> UIView?
    func heightForFooterInSection(inSection section: Int) -> CGFloat
    func heightForRow(in section : Int) -> CGFloat
    func heightForHeaderInSection(in section: Int) -> CGFloat
}

extension TableViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return 0
    }
    
    func viewForFooterInSection(inSection section: Int) -> UIView? {
        return UIView()
    }
    
    func heightForFooterInSection(inSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func heightForRow(in section: Int) -> CGFloat {
        return 66.0
    }
    
    func heightForHeaderInSection(in section: Int) -> CGFloat {
        return 0.0
    }
}

