require 'spec_helper'

describe Bitcoin::Tx do

  describe 'parse from payload' do
    context 'coinbase tx' do
      subject {
        Bitcoin::Tx.parse_from_payload('010000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff2a038c7f110411bd48592f244d696e65642062792037706f6f6c2e636f6d2f0100000bd807000000000000ffffffff0340597307000000001976a91489893957178347e87e2bb3850e6f6937de7372b288ac50d6dc01000000001976a914ca560088c0fb5e6f028faa11085e643e343a8f5c88ac0000000000000000266a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf90120000000000000000000000000000000000000000000000000000000000000000000000000'.htb)
      }
      it 'should be parsed' do
        expect(subject.inputs.length).to eq(1)
        expect(subject.coinbase_tx?).to be true
        expect(subject.to_payload.bth).to eq('010000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff2a038c7f110411bd48592f244d696e65642062792037706f6f6c2e636f6d2f0100000bd807000000000000ffffffff0340597307000000001976a91489893957178347e87e2bb3850e6f6937de7372b288ac50d6dc01000000001976a914ca560088c0fb5e6f028faa11085e643e343a8f5c88ac0000000000000000266a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf90120000000000000000000000000000000000000000000000000000000000000000000000000')
        expect(subject.txid).to eq('2da1db11dea21799d0b8f351a4516b5e3f8f6729da5aee2d43176a188045e2e4')
        expect(subject.wtxid).to eq('f15033791b455b7ae2c3af844796ec5996d205cbaf417c63946a53489a52ec9a')
      end
    end

    context 'standard tx' do
      subject {
        Bitcoin::Tx.parse_from_payload('0100000005294f9022539669658a5d685ba1d446a990de155e8d7eb978a7680286c92d05f9ce0400006a473044022008dfc5d3bf5aa25c4588334d471e83b7dc17ee20c777959710be08e3c21e037302202d0fb34c25ac11af9dd756ecb5eeeba3c2296c1ddc5e85a105da11a922e8fae3012102dd4b77b9baebd48fd6cfbd6038f54442e69bc628b18640a8bac40fb55624ac08ffffffff294f9022539669658a5d685ba1d446a990de155e8d7eb978a7680286c92d05f9cf0400006b483045022100e6d1faacdbdd0562266c9e8ceff6c5d67094fa52ff74be8b74052fecd99c0f7702203457f157810fa886c09bdc42a87cc2145dca9807efe6e623f9d21b907619eaac012102d69f753f4517b9a9bd2ffeb6ad63a2e6d220b4a8db9632a51f740f240663c69affffffff294f9022539669658a5d685ba1d446a990de155e8d7eb978a7680286c92d05f9d00400006a473044022079c6fa01326b14748be66e8a5ccb01de47ef19ea8d79f368703ce93ddd8df8a0022008dad075dcc27fd1a22062c6e7dcb527e9ccff1c19f517977bba1a1bd981d9e2012103b586a8a8bea0864b4c4895a09803e1ac531ad08880eeed07797c4e31ad574dc2ffffffff294f9022539669658a5d685ba1d446a990de155e8d7eb978a7680286c92d05f9d10400006c493046022100f1157996e5a1f45ed2b21eb7bb1578a7b5f41aa0c67e7360adb0de8b862fbc19022100d0b252449686ce0ff250a22b20fc47e77962ee47ea4b04fce59a308801ab7d91012103cdbcb10cea5780f48bb4bb7cd48a38569bc71d1bd84c5870af4dd86593c1a9f0ffffffff294f9022539669658a5d685ba1d446a990de155e8d7eb978a7680286c92d05f9d60400006b483045022100d8ef2555a6a7d4b13105782115863654004e51f95e656c116bf7607ea2343bad0220099aa941dea08190f3975aea43c65b5ecd25e9fb7a5a4fc69bc4a896cf2c43aa012102c5b4b1b0be5584ce8005e1330ffab609986f92ad505d4bae6cd016c1dceb74dbffffffff0200cb4c00010000001976a91424dfc7897d2579c7cbf9b6f7690a20f68ef3efa188ac002c3301040000001976a914b5cf2104dc0c646cf1dd20334b09c730ba5f472d88ac00000000'.htb)
      }
      it 'should be parsed' do
        expect(subject.txid).to eq('9ae1fd1572ffe82e2670e2edd1e2431b37bbb0bb6493e64546447ca8827d1375')
        expect(subject.wtxid).to eq('9ae1fd1572ffe82e2670e2edd1e2431b37bbb0bb6493e64546447ca8827d1375')
        expect(subject.coinbase_tx?).to be false
        expect(subject.version).to eq(1)
        expect(subject.lock_time).to eq(0)
        expect(subject.inputs.length).to eq(5)
        expect(subject.outputs.length).to eq(2)
      end
    end

  end

end