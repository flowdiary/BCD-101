// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    address public immutable i_owner;
    error FundMe__MustBeGreaterThanFiveUsd();
    error FundMe__MustBeContractOwner();
    error FundMe__CallFailed();
    constructor() {
        i_owner = msg.sender;
    }
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5 * 1e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // Collect funds
    function fund() public payable {
        // require(getConversionRate(msg.value) >= minimumUsd, "Must be greater than or equal to 5 USD");
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            FundMe__MustBeGreaterThanFiveUsd()
        );

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] =
            addressToAmountFunded[msg.sender] +
            msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, FundMe__MustBeContractOwner());
        _;
    }
    // Allow admin to withdraw all funds
    function withdraw() public onlyOwner{
        
        for(uint256 i=0; i<funders.length; i++) {
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // transfer
        // send
        // call

        // payable(msg.sender).transfer(address(this).balance);
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");
        (bool callSuccess, ) = payable(msg.sender).call{value: (address(this).balance)}("");
        require(callSuccess, FundMe__CallFailed());

    }
    receive() external payable {
        fund();
     }

    fallback() external payable { 
        fund();
    }
}
