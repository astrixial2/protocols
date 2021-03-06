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
pragma solidity ^0.6.0;


/// @title ImplementationRegistry
/// @dev A registry for wallet implementations.
/// @author Brecht Devos - <brecht@loopring.org>
abstract contract ImplementationRegistry
{
    function registerImplementation(address implementation) external virtual;
    function deregisterImplementation(address implementation) external virtual;
    function isImplementationRegistered(address implementation) public view virtual returns (bool);
    function setDefaultImplementation(address implementation) external virtual;
    function defaultImplementation() public view virtual returns (address);
    function implementations() public view virtual returns (address[] memory _implementation);
    function numOfImplementations() public view virtual returns (uint);
}
