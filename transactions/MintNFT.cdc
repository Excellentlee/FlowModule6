import NonFungibleToken from 0x05
import CryptoPoops from 0x05

transaction(recipientAccount: Address, _name: String, _favFood: String, _luckyNo: Int) {
  prepare(signer: AuthAccount) {
    // Retrieve a reference to the creator of the NFT.
    let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)!

    // Acquire a reference to the publicly accessible NFT collection of the recipient.
    let recipientCollectionRef = getAccount(recipientAccount)
      .getCapability(/public/CryptoPoopsCollection)
      .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
      ?? panic("There is no collection linked to the provided address.")

    // Create a new NFT utilizing the minter reference.
    let nft <- minter.createNFT(name: _name, favouriteFood: _favFood, luckyNumber: _luckyNo)
    
    // Place the freshly created NFT into the recipient's collection.
    recipientCollectionRef.deposit(token: <- nft)
  }

  execute {
    log("The minting and depositing of the NFT were successful.")
  }
}


