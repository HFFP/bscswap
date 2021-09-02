const factory = artifacts.require("BSCswapFactory");
const router = artifacts.require("BSCswapRouter");

module.exports = async function (deployer) {
  const inst = await factory.deployed();
  await deployer.deploy(router, inst.address, "0x1BD9109468be708bd4EEc1A9a90D07003a1C5c9F");
};
