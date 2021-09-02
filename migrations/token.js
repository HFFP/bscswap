const token = artifacts.require("TOKEN1");
const token2 = artifacts.require("TOKEN2");

module.exports = async function (deployer) {
  await deployer.deploy(token);
  await deployer.deploy(token2);
};
