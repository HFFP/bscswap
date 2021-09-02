// SPDX-License-Identifier: GPL-3.0-or-later

import "./interfaces/IBEP20.sol";
pragma solidity >=0.4.22 <0.9.0;

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract TOKEN2 is IBEP20BSCswap {
    // 对uint256 添加SafeMath
    using SafeMath for uint256;

    // 定义映射存储address余额
    mapping (address => uint256) private _balances;

    // 定义映射存储授权余额
    mapping (address => mapping (address => uint256)) private _allowed;

    // 定义基本信息
    string public override name = "TOKEN2";
    uint8 public override decimals = 18;
    string public override symbol = "TOKEN2";
    uint256 public override totalSupply = 1000000000 * 10 ** 18;

    uint256 price = 100000; //  how much token/eth
    address private _owner = msg.sender;

    event ICO(address indexed from, uint256 tAmount, uint256 eAmount);

    constructor() public {
        _balances[msg.sender] = totalSupply;
        //        _balances[teamAddress] = totalSupply.div(10).mul(3);
        //        _balances[jjhAddress] = totalSupply.div(10).mul(3);
    }

    modifier onlyOwner {
        require(msg.sender == _owner);
        _;
    }

    //余额
    function balanceOf(address owner) public override view returns(uint256) {
        return _balances[owner];
    }

    //授权余额
    function allowance(address owner, address spender) public override view returns(uint256) {
        return _allowed[owner][spender];
    }

    //转帐
    function transfer(address to, uint256 value) public override returns(bool) {
        require(value <= _balances[msg.sender]);

        _balances[msg.sender] = _balances[msg.sender].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(msg.sender, to, value);
        return true;
    }

    //授权
    function approve(address spender, uint256 value) public override returns(bool) {
        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    //使用授权转帐
    function transferFrom(address from, address to, uint256 value) public override returns(bool) {
        require(value <= _balances[from]);
        require(value <= _allowed[from][msg.sender]);

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        emit Transfer(from, to, value);
        return true;
    }
}
