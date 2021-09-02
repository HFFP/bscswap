# BSCSwap

### Notice

1. 先 compile Factory并部署
2. compile CalHash 且部署
3. 调用 CalHash.getInitHash() 获得pair的init code
4. 修改 BSCswapLibrary 中的init code hash
5. compile Router 且部署
