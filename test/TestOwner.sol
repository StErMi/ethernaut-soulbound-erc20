// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "./BaseExp.sol";

/// @title Test for Ownership
contract TestOwner is BaseExp {
    // emulete the event model just for testing
    event MinterUpdated(address indexed minter);

    /// @notice Only the owner can set a new minter
    function testOnlyOwnerCanSetMinter() public {
        vm.prank(user);
        vm.expectRevert("Ownable: caller is not the owner");
        exp.setApprovedMinter(user);
    }

    /// @notice The new minter cannot be an empty address
    function testMinterNotZero() public {
        vm.prank(owner);
        vm.expectRevert(Exp.EmptyMinter.selector);
        exp.setApprovedMinter(address(0));
    }

    /// @notice You can't set the new minter as the previus one
    function testMinterNotEqualOld() public {
        vm.startPrank(owner);
        exp.setApprovedMinter(minter);
        vm.expectRevert(Exp.OldMinterEqualNewMinter.selector);
        exp.setApprovedMinter(minter);
        vm.stopPrank();
    }

    /// @notice Owner can set the new minter
    function testSetMinter() public {
        vm.startPrank(owner);
        vm.expectEmit(true, false, false, false);
        emit MinterUpdated(minter);
        exp.setApprovedMinter(minter);
        assertEq(exp.minter(), minter);
    }
}
