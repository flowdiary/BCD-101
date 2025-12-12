# BCD-101 (Blockchain Development: Solidity Edition)

Welcome to **BCD-101**, a beginner-friendly blockchain development course focused on teaching smart contract development using **Solidity**.

This repository contains the list of projects we have completed so far in the course. More will be added as we progress.

---

# 📁 Projects

---

## 1. Age Storage

📄 **Code:**  
https://github.com/flowdiary/BCD-101/blob/main/projects/AgeStorage.sol

### Description
The **Age Storage** smart contract introduces the fundamentals of Solidity development and Ethereum storage patterns.

Key concepts covered include:

- State variables  
- Mappings  
- Dynamic arrays  
- Structs and struct arrays  
- Adding and retrieving on-chain data  
- Removing elements from arrays  

This project builds a strong foundation for understanding how data is stored and organized on the blockchain.

---

## 2. FundMe (Payable Contract + Chainlink Price Feeds)

📄 **FundMe.sol:**  
https://github.com/flowdiary/BCD-101/blob/main/projects/remix/FundMe.sol

📄 **PriceConverter.sol:**  
https://github.com/flowdiary/BCD-101/blob/main/projects/remix/PriceConverter.sol

### Description
The **FundMe** project expands your Solidity knowledge by introducing **payable smart contracts**, **real-time ETH/USD conversion**, and **safe withdrawal mechanisms**.

It demonstrates how to build a contract that collects ETH payments and enforces a minimum USD value using Chainlink price feeds.

### 🚀 Key Features

#### 1. Minimum Funding Requirement (5 USD)
Users must send enough ETH to equal **at least 5 USD**, determined using Chainlink’s ETH/USD oracle.

#### 2. PriceConverter Library
Handles:

- Fetching live ETH/USD price  
- Converting ETH amounts to USD  
- Adjusting decimals  

Uses Chainlink Price Feed (Sepolia):

```bash
0x694AA1769357215DE4FAC081bf1f309aDC325306
```


---

#### 3. Funders Tracking
The contract maintains:

- A dynamic array of funders  
- A mapping from address → amount funded  

---

#### 4. Owner Withdrawal
Only the owner can withdraw all ETH using the secure `.call{value: ...}()` pattern.  
The contract:

- Resets all funders  
- Clears the mapping  
- Prevents unauthorized access using a modifier  
- Uses custom errors for gas savings  

---

#### 5. Receive & Fallback
Both functions forward ETH transfers to the `fund()` function, ensuring:

- No ETH is accidentally lost  
- Wallets that send ETH without data are supported  

---

More projects will be added soon as the course continues.
