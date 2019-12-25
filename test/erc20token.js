var erc20token = artifacts.require("erc20token");

contract("erc20token", function(_accounts) {
  it("should assert true", function(done) {
    erc20token.deployed();
    assert.isTrue(true);
    done();
  });
});
