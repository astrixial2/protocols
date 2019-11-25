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

import "../lib/MathUint.sol";

import "../iface/PriceOracle.sol";

import "./KyberNetworkPriceOracle.sol";
import "./UniswapPriceOracle.sol";


/// @title AggregationalPriceOracle
contract AggregationalPriceOracle is PriceOracle
{
    using MathUint for uint;

    address[] public providers;

    constructor(
        address[] memory _providers
        )
        public
    {
        providers = _providers;
    }

    function getValue(address token, uint amount)
        public
        view
        returns (uint)
    {
        uint total;
        for (uint i = 0; i < providers.length; i++) {
            total = total.add(
                PriceOracle(providers[i]).getValue(token, amount)
            );
        }
        return total / providers.length;
    }
}