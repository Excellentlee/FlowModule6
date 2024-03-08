import NonFungibleToken from 0x05
import CryptoPoops from 0x05

//Primary script function for retrieving NFT IDs from a public collection associated with an account.
pub fun main(acctAddress: Address): [UInt64] {
    
    // Obtain a reference to the publicly accessible NFT collection associated with the account.
    let collectionRef = getAccount(acctAddress)
        .getCapability(/public/CryptoPoopsCollection)
        .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
        ?? panic("No associated collection found for the address.")

    // Obtain the NFT IDs from the public collection by calling the getIDs function.
    return collectionRef.getIDs()
}

