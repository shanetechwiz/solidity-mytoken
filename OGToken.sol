pragma solidity ^0.5.10;

contract OGToken {
    mapping (address => uint256) private _balances;

    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;

    constructor(uint256 initialSupply, string memory tokenName, string memory tokenSymbol, uint8 decimalUnits) public {
        _balances[msg.sender] = initialSupply;
        _totalSupply = initialSupply;
        _decimals = decimalUnits;
        _name = tokenName;
        _symbol = tokenSymbol;

    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function setTotalSupply(uint256 totalAmount) internal {
        _totalSupply = totalAmount;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function setBalance(address account, uint256 balance) internal {
        _balances[account] = balance;
    }

    function transfer(address beneficiary, uint256 amount) public returns (bool) {
        require(beneficiary != address(0), "Beneficiary address cannot be zero");
        require(_balances[msg.sender] >= amount, "Sender does not have enough tokens");
        require(_balances[beneficiary] + amount > _balances[beneficiary], "Addition overflow");

        _balances[msg.sender] -= amount;
        _balances[beneficiary] += amount;
        return true;
    }
}