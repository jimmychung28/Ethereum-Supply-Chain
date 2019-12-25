var supplyChain = artifacts.require("supplyChain");

contract("supplyChain", async accounts =>{
  it("should create a Participant", async()=> {
     let instance=await supplyChain.deployed();
     let participantId=await instance.createParticipant("A","passA","0x66b96E1597fD7B553e67460Ef383C90D65C222Bb","Manufacturing");
     let participant=await instance.participants(0);

      assert.equal(participant[0],"A");
      assert.equal(participant[2],"Manufacturing");

      participantId=await instance.createParticipant("B","passB","0x6eF671c9fCC9590fDfd047fF9e0F6ce76A9F3D07","Supplier");
      participant=await instance.participants(1);
      assert.equal(participant[0],"B");
      assert.equal(participant[2],"Supplier");

      participantId=await instance.createParticipant("C","passC","0x559Db611186002f0195139D65Caf1fCB2149D5fc","Consumer");
      participant=await instance.participants(2);
      assert.equal(participant[0],"C");
      assert.equal(participant[2],"Consumer");
  });

  it("should return Participant details",async()=>{
    let instance=await supplyChain.deployed();
    let participantDetails=await instance.getParticipantDetails(0);
    assert.equal(participantDetails[0],"A");

    instance=await supplyChain.deployed();
    participantDetails=await instance.getParticipantDetails(1);
    assert.equal(participantDetails[0],"B");

    instance=await supplyChain.deployed();
    participantDetails=await instance.getParticipantDetails(2);
    assert.equal(participantDetails[0],"C");
  });
});
