// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity =0.6.12;
import './BSCswapPair.sol';

contract CalHash {
    function getInitHash() public pure returns(bytes32){
        bytes memory bytecode = type(BSCswapPair).creationCode;
        return keccak256(abi.encodePacked(bytecode));
    }
}
