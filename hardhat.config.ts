import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";



const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: "https://1rpc.io/sepolia",
      accounts: ["9fdb391b067f21015d89bfd94bd7c3ba5d80989585c0533f1ac0566193a056f6"]
    }
  }
};

export default config;
