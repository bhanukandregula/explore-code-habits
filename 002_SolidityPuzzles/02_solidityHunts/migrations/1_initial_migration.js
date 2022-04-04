const Summation = artifacts.require("Summation");

module.exports = function (deployer) {
  deployer.deploy(Summation);
};
