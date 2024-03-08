import CryptoPoops from 0x05

transaction() {
  prepare(signer: AuthAccount) {
    // Verify whether a collection is already present in the storage of the account.
    if signer.borrow<&CryptoPoops.Collection>(from: /storage/CryptoPoopsCollection) != nil {
      log("A collection is already in existence.")
      return
    }

    // Establish a fresh collection within the storage of the account.
    signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/CryptoPoopsCollection)

    // Enable public access to it.
    signer.link<&CryptoPoops.Collection>(/public/CryptoPoopsCollection, target: /storage/CryptoPoopsCollection)

    log("The creation of the collection has been successfully completed.")
  }
}

