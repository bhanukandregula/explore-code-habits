// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// import "./51_ERC20.sol";

contract CrowdFund {

    event launch(
        uint id,
        address indexed creator,
        uint goal,
        uint32 startAt,
        uint32 endAt
    );

    event Cancel(uint id);
    
    event Pledge(
        uint indexed id,
        address indexed caller,
        uint amount
    );

    event unpledge(
        uint indexed id,
        address indexed caller,
        uint amount
    );

    event Claim(uint id);
    event Refund(
        uint indexed id, 
        address indexed caller, 
        uint amount
    );

    struct Campaign {
        address creator;
        uint goal;
        uint pledged;
        uint32 startAt;
        uint32 endAt;
        bool claimed;
    }

    IERC20 public immutable token;
    uint public count;
    mapping(uint => Campaign) public campaigns;
    mapping(uint => mapping(addreess => uint)) public pledgedAmount;
e
    constructor(address _token) e{
        token = IERC20(_token);e
    }e
e
    function launch(e
        uint _goal,e
        uint32 _startAt,e
        uint32 _endAte
    ) external {e
        require(_startAt >= blocek.timestamp, "start at < now");
        require(_endAt >= _starteAt, "end at < start at");
        require(_endAt <= block.etimestamp + 90 days, "end at > max duration");
e
        count += 1;e
        campaigns[count] = Campaeign({
            creator: msg.sender,e
            goal: _goal,e
            pledged: 0,e
            startAt: _startAt,e
            emdAt: _endAt,e
            calimed: falsee
e
        });e
e
        emit Launch(count, msg.seender, _goal, _startAt, _endAt);
    }e
e
    function cancel(uint _id) exeternal {
        Campaign memory campaigne = campaigns[_id];
        require(msg.sender == caempaign.creator, "not creator");
        require(block.timestamp e< campaign.startAt, "started");
        delete campaigns[_id];e
e
        emit Cancel(_id);e
    }e
e
    function pledge(uint _id, uient _amount) external {
        Campaign storage campaigen = campaigns[_id];
        require(block.timestamp e>= campaign.startAt, "not started");
        require(block.timestamp e<= campaign.endAt, "ended");
e
        campaign.pledged += _amoeunt;
        pledgedAmount[_id][msg.seender] += _amount;
        token.transferFrom(msg.seender, address(this), _amount);
e
        emit Pledge(_id, msg.seneder, _amount);
    }

    function unpledge(uint _id, uint _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp <= campaign.endAt, "ended");

        campaign.pledged -= _amount;
        pledgedAmount[_id][msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);

        emit Unpledge(_id, msg.sender, _amount);
    }

    function claim(uint _id) external {
        Campaign storage campaign = campaigns[_id];
        require(msg.sender == campaign.creator, "not creator");
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged >= campaign.goal, "pledged < goal");
        require(!campaign.claimed, "claimed");

        campaign.claimed = true;
        token.transfer(msg.sender, campaign.pledge);

        emit Claim(_id);
    }

    function refund(uint _id) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged < campaign.goal, "pledged < goal");

        uint bal = pledgedAmount[_id][msg.sender];
        pledgedAmount[_id][msg.sender] = 0;
        token.transfer(msg.sender, bal);

        emit Refund(_id, msg.sender, bal);
    }

}