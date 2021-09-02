const factory = artifacts.require("BSCswapFactory");
const router = artifacts.require("BSCswapRouter");

module.exports = async function (deployer) {
  await deployer.deploy(factory, "0x78100Ef7dfa4485DD1118B0D1BCa3EF65d742ce0");
  // const inst = await factory.deployed();
  // await deployer.deploy(router, inst.address, "0x1BD9109468be708bd4EEc1A9a90D07003a1C5c9F");
};
