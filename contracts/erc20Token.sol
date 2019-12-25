pragma solidity ^0.5.11;

import "./erc20Interface.sol";

contract ERC20Token is ERC20Interface{
    uint256 constant private MAX_UINT256=2**256-1;
    mapping (address=>uint256) public balances;
    mapping(address=>mapping(address=>uint256)) public allowed;

    uint256 public totalSupply;
    string public name;
    uint8 public decimals;
    string public symbol;

    constructor(uint256 _initialAmount, string memory _tokenName,uint8 _decimalUnits, string memory _tokenSymbol)public {
        balances[msg.sender]=_initialAmount;
        totalSupply=_initialAmount;
        name=_tokenName;
        decimals=_decimalUnits;
        symbol =_tokenSymbol;
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(_value>=0,"Cannot transfer negative amount");
        require(balances[msg.sender]>=_value,"Insufficient funds");
        balances[msg.sender]-=_value;
        balances[_to]+=_value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from,address _to,uint256 _value) public returns (bool success){
        uint256 allowance=allowed[_from][msg.sender];
        require(balances[_from]>=_value && allowance >=_value,"Insufficient funds");
        balances[_from]-=_value;
        balances[_to]+=_value;
        if(allowance<MAX_UINT256){
            allowed[_from][msg.sender]-=_value;
        }
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance){
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        allowed[msg.sender][_spender]=_value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    function allowance(address _owner, address _spender) public view returns(uint256 remaining){
        return allowed[_owner][_spender];
    }

}