// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {Funding} from "../src/Funding.sol";

contract fundingTest is Test{

    Funding funding;

    function setUp() public {
        funding = new Funding();
    }
    function testMinIsFive() public view{
        assertEq(funding.MINIMUM_USD(), 5e18, "The minimum $ amount is not $5 or 5e18");
    }
    function testOwnerIsSender() public view{
        assertEq(funding.i_owner(), address(this), "The owner of the contradt is not the message sender");
    }
    function testPriceFeedVersionIsAccurate() public view {
        uint256 version = funding.getVersion();
        assertEq(version, 4, "The version is not corrrect");
    }
}