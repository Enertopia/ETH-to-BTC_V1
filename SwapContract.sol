// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract SwapContract {
    address public owner;
    AggregatorV3Interface internal priceFeed;

    struct Swap {
        address ethSender;
        uint256 ethAmount;
        uint256 btcAmount;
        uint256 expiryTime;
        bool isCompleted;
        bytes32 secretHash;
    }

    mapping(bytes32 => Swap) public swaps;

    event SwapCreated(bytes32 indexed swapId, address indexed ethSender, uint256 ethAmount, uint256 btcAmount, uint256 expiryTime);
    event SwapExecuted(bytes32 indexed swapId);

    constructor(address _priceFeed) {
        owner = msg.sender;
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    function lockETH(uint256 btcAmount, uint256 duration, bytes32 secretHash) public payable {
        require(msg.value > 0, "ETH amount must be greater than 0");
        bytes32 swapId = keccak256(abi.encodePacked(msg.sender, block.timestamp));
        swaps[swapId] = Swap(msg.sender, msg.value, btcAmount, block.timestamp + duration, false, secretHash);
        emit SwapCreated(swapId, msg.sender, msg.value, btcAmount, block.timestamp + duration);
    }

    function getLatestPrice() public view returns (int) {
        (,int price,,,) = priceFeed.latestRoundData();
        return price;
    }

    function executeSwap(bytes32 swapId, bytes32 secret) public {
        Swap storage swap = swaps[swapId];
        require(swap.ethSender == msg.sender, "Unauthorized");
        require(block.timestamp <= swap.expiryTime, "Swap expired");
        require(keccak256(abi.encodePacked(secret)) == swap.secretHash, "Invalid secret");
        require(!swap.isCompleted, "Swap already completed");

        // Logic to verify BTC lock on Bitcoin network (handled off-chain)

        swap.isCompleted = true;
        // Transfer ETH to BTC sender (to be implemented)
        emit SwapExecuted(swapId);
    }

    // Additional utility functions...
}
