// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

interface IExp {
    /*//////////////////////////////////////////////////////////////
                                 PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Set the new minter user
    /// @dev only owner can call this method
    /// @param newMinter the new minter
    function setApprovedMinter(address newMinter) external;

    /// @notice Mint EXP tokens
    /// @dev only minter can call this method
    /// @param to The receiver of the minted
    /// @param amount The amount of exp to be minted
    function mint(address to, uint256 amount) external;
}
