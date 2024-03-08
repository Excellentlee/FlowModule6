import NonFungibleToken from 0x05
import CryptoPoops from 0x05

pub fun main(acctAddress: Address, id: UInt64): &NonFungibleToken.NFT {
// Acquire a reference to the accessible collection by utilizing the given address.
    let contract = getAccount(acctAddress).getCapability(/public/CryptoPoopsCollection)
      .borrow<&CryptoPoops.Collection>() ?? panic("Could not borrow collection reference")
    

    // Obtain a reference to the NFT metadata by utilizing the borrowAuthNFT function.
  let nftData = contract.borrowAuthNFT(id: id)
  
  // Provide the referenced NFT upon borrowing.
  return nftData
}

