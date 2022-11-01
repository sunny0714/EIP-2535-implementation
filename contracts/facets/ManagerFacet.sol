// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManagerFacet {
    bytes32 public constant UBQ_MINTER_ROLE = keccak256("UBQ_MINTER_ROLE");
    bytes32 public constant UBQ_BURNER_ROLE = keccak256("UBQ_BURNER_ROLE");

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant COUPON_MANAGER_ROLE = keccak256("COUPON_MANAGER");
    bytes32 public constant BONDING_MANAGER_ROLE = keccak256("BONDING_MANAGER");
    bytes32 public constant INCENTIVE_MANAGER_ROLE = keccak256("INCENTIVE_MANAGER");
    bytes32 public constant UBQ_TOKEN_MANAGER_ROLE = keccak256("UBQ_TOKEN_MANAGER_ROLE");
    address public debtCouponAddress;
    address public dollarTokenAddress; // uAD
    address public couponCalculatorAddress;
    address public dollarMintingCalculatorAddress;
    address public bondingShareAddress;
    address public bondingContractAddress;
    address public stableSwapMetaPoolAddress;
    address public curve3PoolTokenAddress; // 3CRV
    address public treasuryAddress;
    address public governanceTokenAddress; // uGOV
    address public sushiSwapPoolAddress; // sushi pool uAD-uGOV
    address public masterChefAddress;
    address public formulasAddress;
    address public autoRedeemTokenAddress; // uAR
    address public uarCalculatorAddress; // uAR calculator

    //key = address of couponmanager, value = excessdollardistributor
    mapping(address => address) private _excessDollarDistributors;

    function setuARTokenAddress(address _uarTokenAddress) external {
        autoRedeemTokenAddress = _uarTokenAddress;
    }

    function setDebtCouponAddress(address _debtCouponAddress)
        external
    {
        debtCouponAddress = _debtCouponAddress;
    }

    function setDollarTokenAddress(address _dollarTokenAddress)
        external
    {
        dollarTokenAddress = _dollarTokenAddress;
    }

    function setGovernanceTokenAddress(address _governanceTokenAddress)
        external
    {
        governanceTokenAddress = _governanceTokenAddress;
    }

    function setSushiSwapPoolAddress(address _sushiSwapPoolAddress)
        external
    {
        sushiSwapPoolAddress = _sushiSwapPoolAddress;
    }

    function setUARCalculatorAddress(address _uarCalculatorAddress)
        external
    {
        uarCalculatorAddress = _uarCalculatorAddress;
    }

    function setCouponCalculatorAddress(address _couponCalculatorAddress)
        external
    {
        couponCalculatorAddress = _couponCalculatorAddress;
    }

    function setDollarMintingCalculatorAddress(
        address _dollarMintingCalculatorAddress
    ) external {
        dollarMintingCalculatorAddress = _dollarMintingCalculatorAddress;
    }

    function setExcessDollarsDistributor(
        address debtCouponManagerAddress,
        address excessCouponDistributor
    ) external {
        _excessDollarDistributors[debtCouponManagerAddress] =
            excessCouponDistributor;
    }

    function setMasterChefAddress(address _masterChefAddress)
        external
    {
        masterChefAddress = _masterChefAddress;
    }

    function setFormulasAddress(address _formulasAddress) external {
        formulasAddress = _formulasAddress;
    }

    function setBondingShareAddress(address _bondingShareAddress)
        external
    {
        bondingShareAddress = _bondingShareAddress;
    }

    function setStableSwapMetaPoolAddress(address _stableSwapMetaPoolAddress)
        external
    {
        stableSwapMetaPoolAddress = _stableSwapMetaPoolAddress;
    }

    /**
     * @notice set the bonding bontract smart contract address
     * @dev bonding contract participants deposit  curve LP token
     * for a certain duration to earn uGOV and more curve LP token
     * @param _bondingContractAddress bonding contract address
     */
    function setBondingContractAddress(address _bondingContractAddress)
        external
    {
        bondingContractAddress = _bondingContractAddress;
    }

    /**
     * @notice set the treasury address
     * @dev the treasury fund is used to maintain the protocol
     * @param _treasuryAddress treasury fund address
     */
    function setTreasuryAddress(address _treasuryAddress) external {
        treasuryAddress = _treasuryAddress;
    }

    function getExcessDollarsDistributor(address _debtCouponManagerAddress)
        external
        view
        returns (address)
    {
        return _excessDollarDistributors[_debtCouponManagerAddress];
    }
}
