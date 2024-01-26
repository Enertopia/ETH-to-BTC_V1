Decentralized ETH-BTC Swap Mechanism
Overview

This project implements a decentralized swap mechanism between Ethereum (ETH) and Bitcoin (BTC). It aims to facilitate trustless, secure, and efficient swaps without relying on intermediaries. The system combines Ethereum smart contracts, Bitcoin HTLC scripts, a decentralized price discovery mechanism, cross-chain communication, and a user-friendly interface.
Features

    Smart Contract on Ethereum: Manages ETH locking, interfaces with price oracles, and executes swaps.
    Trustless Escrow on Bitcoin: Uses Bitcoin script (HTLC) to securely lock and unlock BTC.
    Decentralized Price Discovery: Aggregates prices from multiple sources for fair market rates.
    Cross-Chain Communication: Ensures atomicity of swaps across Ethereum and Bitcoin blockchains.
    User Interface: Simplifies the process of initiating and tracking swaps.

Getting Started
Prerequisites

    Node.js
    Truffle Suite
    Ganache (for local Ethereum blockchain simulation)
    A Bitcoin testnet wallet

Installation

    Clone the Repository

    sh

git clone [repository-url]

Install Dependencies

sh

cd ethereum-contract
npm install

Compile and Deploy Smart Contract

sh

truffle compile
truffle migrate --reset

Set up the Bitcoin Script

    Deploy the HTLC script on the Bitcoin testnet.

Run the Price Discovery Service

sh

cd price-discovery
npm start

Start the User Interface

sh

    cd user-interface
    npm install
    npm start

Usage

    Use the user interface to initiate ETH-BTC swaps.
    Monitor swap status and complete transactions as per the instructions on the interface.

Contributing

Contributions are welcome! If you have suggestions or want to contribute to the code, please follow these steps:

    Fork the Repository
    Create a Feature Branch (git checkout -b feature/AmazingFeature)
    Commit Your Changes (git commit -m 'Add some AmazingFeature')
    Push to the Branch (git push origin feature/AmazingFeature)
    Open a Pull Request
