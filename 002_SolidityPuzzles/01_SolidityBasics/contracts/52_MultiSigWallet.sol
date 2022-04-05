// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MultiSigWallet {
    // When is ETH is deposited
    event Deposit(address indexed sender, uint amount);
    // When the transaction is submitted
    event Submit(uint indexed txId);
    // Other owners can approve the transaction
    event Approve(address indexed owner, uint indexed txId);
    // Other owners can revoke the transaction
    event Revoke(address indexed owner, uint indexed txId);
    // Once we have sufficient amount of approvals, then contract will be executed
    event Execute(uint indexed txId);

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
    }

    // we have to store few owners
    address[] public owners;
    // If an address is the owner of multiSigWallet, then it returns true, else false.
    mapping(address => bool) public isOwner;
    /**
        - Once the transaction is submitted to this contract,
        others owners has to approve before that transaction can be executed

        - num of approvals that is required before it is executed, we will store it in uint
     */
    uint public required;

    Transaction[] public transactions;
    mapping(uint => mapping(address => bool))public approved;

    modifier onlyOwner {
        require(isOwner[msg.sender], "not owner");
        _;
    }

    modifier txExists(uint _txId) {
        require(_txId < transactions.length, "tx does not exists");
        _;
    }

    modifier notApproved(uint _txId) {
        require(!approved[_txId][msg.sender], "tx already approved");
        _;
    }

    modifier notExecuted(uint _txId) {
        require(!transactions[_txId].executed, "tx already executed");
        _;
    }

    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "owners required");
        require( _required > 0 && _required <= _owners.length, "invalid required number of owners");    
        for(uint i; i< _owners.length; i++) {
            address owner = _owners[i];
            
            require(owner != address(0), "Invalid owner");
            require(!isOwner[owner], "owner is not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }

        required = _required;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function submit(address _to, uint _value, bytes calldata _data) external onlyOwner {
        transactions.push(Transaction({
            to: _to,
            value: _value,
            data: _data,
            executed: false
        }));

        emit Submit(transactions.length - 1);
    }

    function approve(uint _txId) 
        external 
        onlyOwner 
        txExists(_txId) 
        notApproved(_txId)
        notExecuted(_txId) {
            approved[_txId][msg.sender] = true;
            emit Approve(msg.sender, _txId);
    }

    function _getApprovalCount(uint _txId) private view returns (uint count) {
        for(uint i; i< owners.length; i++){
            if(approved[_txId][owners[i]]){
                count += 1;
            }
        }
    }

    function execute(uint _txId) 
        external 
        txExists(_txId)
        notExecuted(_txId){
            require(_getApprovalCount(_txId) >= required, "approvals < required");
            Transaction storage transaction = transactions[_txId];

            transaction.executed =  true;
            (bool success, ) = transaction.to.call{value: transaction.value}(transaction.data);
            require(success, "tx failed");

            emit Execute(_txId);
    }

    function revoke(uint _txId) 
        external
        onlyOwner
        txExists(_txId)
        notExecuted(_txId){
            require(approved[_txId][msg.sender], "tx not approved");
            approved[_txId][msg.sender] = false;
            emit Revoke(msg.sender, _txId);
        }
}