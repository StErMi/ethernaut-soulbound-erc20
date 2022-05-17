// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "./BaseExp.sol";

/// @title Test for Ownership
contract TestMint is BaseExp {
    // emulete the event model just for testing
    event Transfer(address indexed from, address indexed to, uint256 value);

    function setUp() public override {
        super.setUp();

        vm.prank(owner);
        exp.setApprovedMinter(minter);
    }

    /// @notice Only minter role can mint
    function testOnlyMinterCanMint() public {
        vm.prank(owner);
        vm.expectRevert(Exp.OnlyMinter.selector);
        exp.mint(user, 1);
    }

    // @notice Mint successful
    function testMint() public {
        uint256 totalSupplyBefore = exp.totalSupply();
        uint256 userBalanceBefore = exp.balanceOf(user);
        uint256 amountToMint = 3;

        vm.prank(minter);
        vm.expectEmit(true, true, true, false);
        emit Transfer(address(0), user, amountToMint);
        exp.mint(user, amountToMint);

        assertEq(exp.balanceOf(user), userBalanceBefore + amountToMint);
        assertEq(exp.totalSupply(), totalSupplyBefore + amountToMint);
    }
}
