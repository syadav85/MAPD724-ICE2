//
//  GameProtocol.swift
//  MAPD724-ICE1
//
//  Created by Satender Yadav on 1/21/23.
//  Student ID: 301293305
//

protocol GameProtocol
{
    // Initialization
    func Start()
    
    // update every frame
    func Update()
    
    // check if the position is outside the bounds of the Screen
    func CheckBounds()
    
    // a method to reset the position
    func Reset()
}

