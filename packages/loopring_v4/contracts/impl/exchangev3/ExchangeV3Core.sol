/*

  Copyright 2017 Loopring Project Ltd (Loopring Foundation).

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/
pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "../../iface/IExchangeV3.sol";


/// @title IExchangeV3Accounts
/// @author Brecht Devos - <brecht@loopring.org>
/// @author Daniel Wang  - <daniel@loopring.org>
contract ExchangeV3Core is IExchangeV3
{
    string  constant public version = "3.0-beta5";
    bytes32 constant public genesisBlockHash = 0x2b4827daf74c0ab30deb68b1c337dec40579bb3ff45ce9478288e1a2b83a3a01;

    ExchangeData.State public state;

    modifier onlyModule()
    {
        require(state.addressToModuleMap[msg.sender] != 0, "UNAUTHORIZED");
        _;
    }

    modifier onlyOperator()
    {
        require(msg.sender == state.operator, "UNAUTHORIZED");
        _;
    }

    modifier onlyWhenUninitialized()
    {
        require(owner == address(0) && state.id == 0, "INITIALIZED");
        _;
    }
}