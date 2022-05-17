// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "./interface/IExp.sol";

/// @title Exp nft contract
/// @notice The NFT Token is soulbound
contract Exp is IExp, ERC20, Ownable {
    /*//////////////////////////////////////////////////////////////
                                 STORAGE
    //////////////////////////////////////////////////////////////*/

    /// @notice
    address public minter;

    // ERRORS
    error Soulbound();
    error OnlyMinter();
    error EmptyMinter();
    error OldMinterEqualNewMinter();

    /*//////////////////////////////////////////////////////////////
                                 EVENTS
    //////////////////////////////////////////////////////////////*/

    /// @notice Emitted when the minter role is updated
    /// @param minter The new minter address
    event MinterUpdated(address indexed minter);

    /*//////////////////////////////////////////////////////////////
                                 MODIFIERS
    //////////////////////////////////////////////////////////////*/

    modifier onlyMinter() {
        if (msg.sender != minter) revert OnlyMinter();
        _;
    }

    /*//////////////////////////////////////////////////////////////
                                 CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    constructor() ERC20("EXP", "EXP") {}

    /*//////////////////////////////////////////////////////////////
                                 PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Set the new minter user
    /// @dev only owner can call this method
    /// @param newMinter the new minter
    function setApprovedMinter(address newMinter) external onlyOwner {
        // the new minter cannot be a empty
        if (newMinter == address(0)) revert EmptyMinter();
        // the new minter cannot be the same as the old one (prevent event spam)
        if (newMinter == minter) revert OldMinterEqualNewMinter();

        minter = newMinter;
        emit MinterUpdated(newMinter);
    }

    /// @notice Mint EXP tokens and send them to `to` user
    /// @dev only minter can call this method
    /// @param to The receiver of the minted tokens
    /// @param amount The amount of exp to be minted
    function mint(address to, uint256 amount) external override onlyMinter {
        _mint(to, amount);
    }

    /*//////////////////////////////////////////////////////////////
                                 ERC20 OVERRIDE FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Overridden to be soulbound, tokens cannot be transferred
    function transfer(address to, uint256 amount) public pure override returns (bool) {
        revert Soulbound();
    }

    /// @notice Overridden to be soulbound, tokens cannot be transferred
    function allowance(address owner, address spender) public pure override returns (uint256) {
        revert Soulbound();
    }

    /// @notice Overridden to be soulbound, tokens cannot be transferred
    function approve(address spender, uint256 amount) public pure override returns (bool) {
        revert Soulbound();
    }

    /// @notice Overridden to be soulbound, tokens cannot be transferred
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public override returns (bool) {
        revert Soulbound();
    }

    /// @notice Overridden to be soulbound, tokens cannot be transferred
    function increaseAllowance(address spender, uint256 addedValue) public pure override returns (bool) {
        revert Soulbound();
    }

    /// @notice Overridden to be soulbound, tokens cannot be transferred
    function decreaseAllowance(address spender, uint256 subtractedValue) public pure override returns (bool) {
        revert Soulbound();
    }
}
