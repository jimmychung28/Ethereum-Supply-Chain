pragma solidity ^0.5.11;

contract ERC20Interface{
    uint256 public totalSupply;

   // function totalSupply() public view returns(uint);
    function balanceOf(address toeknOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address psender) public view returns(uint remianing);
    function transfer(address to,uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns(bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender,uint tokens);
}