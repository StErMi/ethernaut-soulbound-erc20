// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Exp.sol";
import "./Utilities.sol";

contract BaseExp is Test {
    Exp exp;
    Utilities utilities;

    address owner;
    address minter;
    address user;

    function setUp() public virtual {
        utilities = new Utilities();

        address payable[] memory users = utilities.createUsers(3);
        owner = users[0];
        minter = users[1];
        user = users[2];

        // owner is the user deploying the Exp token
        vm.prank(owner);
        exp = new Exp();

        assertEq(exp.owner(), owner);
        assertEq(exp.totalSupply(), 0);
    }
}
