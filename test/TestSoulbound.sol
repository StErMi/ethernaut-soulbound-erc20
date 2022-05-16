// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "./BaseExp.sol";

/// @title Test for Ownership
contract TestSoulbound is BaseExp {

    uint256 constant AMOUNT_TO_MINT = 10;

    function setUp() public override {
        super.setUp();
        
        vm.prank(owner);
        exp.setApprovedMinter(minter);

        vm.prank(minter);
        exp.mint(user, AMOUNT_TO_MINT);
    }

    /// @notice Token is Soulbound, cannot call transfer
    function testCannotTransfer() public {
        vm.expectRevert(Exp.Soulbound.selector);
        exp.transfer(minter, AMOUNT_TO_MINT);
    }

    /// @notice Token is Soulbound, cannot call allowance
    function testCannotAllowance() public {
        vm.expectRevert(Exp.Soulbound.selector);
        exp.allowance(user, minter);
    }

    /// @notice Token is Soulbound, cannot call approve
    function testCannotApprove() public {
        vm.expectRevert(Exp.Soulbound.selector);
        exp.approve(minter, AMOUNT_TO_MINT);
    }

    /// @notice Token is Soulbound, cannot call transferFrom
    function testCannotTransferFrom() public {
        vm.expectRevert(Exp.Soulbound.selector);
        exp.transferFrom(user, minter, AMOUNT_TO_MINT);
    }

    /// @notice Token is Soulbound, cannot call increaseAllowance
    function testCannotIncreaseAllowance() public {
        vm.expectRevert(Exp.Soulbound.selector);
        exp.increaseAllowance(minter, AMOUNT_TO_MINT);
    }

    /// @notice Token is Soulbound, cannot call decreaseAllowance
    function testCannotDecreaseAllowance() public {
        vm.expectRevert(Exp.Soulbound.selector);
        exp.decreaseAllowance(minter, AMOUNT_TO_MINT);
    }


}
