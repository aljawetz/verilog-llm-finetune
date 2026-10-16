`timescale 1ns/1ps

module tb_sbox5;

    reg [1:0] addr;
    wire [1:0] dout;
    
    // Instantiate the module under test
    sbox5 uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Test sequence
        addr = 0; #10;
        if (dout !== 2) $display("FAIL: Expected dout=2 for addr=0");
        
        addr = 1; #10;
        if (dout !== 12) $display("FAIL: Expected dout=12 for addr=1");
        
        addr = 2; #10;
        if (dout !== 4) $display("FAIL: Expected dout=4 for addr=2");
        
        addr = 3; #10;
        if (dout !== 1) $display("FAIL: Expected dout=1 for addr=3");
        
        addr = 4; #10;
        if (dout !== 7) $display("FAIL: Expected dout=7 for addr=4");
        
        addr = 5; #10;
        if (dout !== 10) $display("FAIL: Expected dout=10 for addr=5");
        
        addr = 6; #10;
        if (dout !== 11) $display("FAIL: Expected dout=11 for addr=6");
        
        addr = 7; #10;
        if (dout !== 6) $display("FAIL: Expected dout=6 for addr=7");
        
        addr = 8; #10;
        if (dout !== 8) $display("FAIL: Expected dout=8 for addr=8");
        
        addr = 9; #10;
        if (dout !== 5) $display("FAIL: Expected dout=5 for addr=9");
        
        addr = 10; #10;
        if (dout !== 3) $display("FAIL: Expected dout=3 for addr=10");
        
        addr = 11; #10;
        if (dout !== 15) $display("FAIL: Expected dout=15 for addr=11");
        
        addr = 12; #10;
        if (dout !== 13) $display("FAIL: Expected dout=13 for addr=12");
        
        addr = 13; #10;
        if (dout !== 0) $display("FAIL: Expected dout=0 for addr=13");
        
        addr = 14; #10;
        if (dout !== 14) $display("FAIL: Expected dout=14 for addr=14");
        
        addr = 15; #10;
        if (dout !== 9) $display("FAIL: Expected dout=9 for addr=15");

        // Additional tests for higher addresses
        addr = 16; #10;
        if (dout !== 14) $display("FAIL: Expected dout=14 for addr=16");
        
        addr = 17; #10;
        if (dout !== 11) $display("FAIL: Expected dout=11 for addr=17");
        
        addr = 18; #10;
        if (dout !== 2) $display("FAIL: Expected dout=2 for addr=18");
        
        addr = 19; #10;
        if (dout !== 12) $display("FAIL: Expected dout=12 for addr=19");
        
        addr = 20; #10;
        if (dout !== 4) $display("FAIL: Expected dout=4 for addr=20");
        
        addr = 21; #10;
        if (dout !== 7) $display("FAIL: Expected dout=7 for addr=21");
        
        addr = 22; #10;
        if (dout !== 13) $display("FAIL: Expected dout=13 for addr=22");
        
        addr = 23; #10;
        if (dout !== 1) $display("FAIL: Expected dout=1 for addr=23");
        
        addr = 24; #10;
        if (dout !== 5) $display("FAIL: Expected dout=5 for addr=24");
        
        addr = 25; #10;
        if (dout !== 0) $display("FAIL: Expected dout=0 for addr=25");
        
        addr = 26; #10;
        if (dout !== 15) $display("FAIL: Expected dout=15 for addr=26");
        
        addr = 27; #10;
        if (dout !== 10) $display("FAIL: Expected dout=10 for addr=27");
        
        addr = 28; #10;
        if (dout !== 3) $display("FAIL: Expected dout=3 for addr=28");
        
        addr = 29; #10;
        if (dout !== 9) $display("FAIL: Expected dout=9 for addr=29");
        
        addr = 30; #10;
        if (dout !== 8) $display("FAIL: Expected dout=8 for addr=30");
        
        addr = 31; #10;
        if (dout !== 6) $display("FAIL: Expected dout=6 for addr=31");

        // Additional tests for the next set of addresses
        addr = 32; #10;
        if (dout !== 4) $display("FAIL: Expected dout=4 for addr=32");
        
        addr = 33; #10;
        if (dout !== 2) $display("FAIL: Expected dout=2 for addr=33");
        
        addr = 34; #10;
        if (dout !== 1) $display("FAIL: Expected dout=1 for addr=34");
        
        addr = 35; #10;
        if (dout !== 11) $display("FAIL: Expected dout=11 for addr=35");
        
        addr = 36; #10;
        if (dout !== 10) $display("FAIL: Expected dout=10 for addr=36");
        
        addr = 37; #10;
        if (dout !== 13) $display("FAIL: Expected dout=13 for addr=37");
        
        addr = 38; #10;
        if (dout !== 7) $display("FAIL: Expected dout=7 for addr=38");
        
        addr = 39; #10;
        if (dout !== 8) $display("FAIL: Expected dout=8 for addr=39");
        
        addr = 40; #10;
        if (dout !== 15) $display("FAIL: Expected dout=15 for addr=40");
        
        addr = 41; #10;
        if (dout !== 9) $display("FAIL: Expected dout=9 for addr=41");
        
        addr = 42; #10;
        if (dout !== 12) $display("FAIL: Expected dout=12 for addr=42");
        
        addr = 43; #10;
        if (dout !== 5) $display("FAIL: Expected dout=5 for addr=43");
        
        addr = 44; #10;
        if (dout !== 6) $display("FAIL: Expected dout=6 for addr=44");
        
        addr = 45; #10;
        if (dout !== 3) $display("FAIL: Expected dout=3 for addr=45");
        
        addr = 46; #10;
        if (dout !== 0) $display("FAIL: Expected dout=0 for addr=46");
        
        addr = 47; #10;
        if (dout !== 14) $display("FAIL: Expected dout=14 for addr=47");

        // Final set of tests
        addr = 48; #10;
        if (dout !== 11) $display("FAIL: Expected dout=11 for addr=48");
        
        addr = 49; #10;
        if (dout !== 8) $display("FAIL: Expected dout=8 for addr=49");
        
        addr = 50; #10;
        if (dout !== 12) $display("FAIL: Expected dout=12 for addr=50");
        
        addr = 51; #10;
        if (dout !== 7) $display("FAIL: Expected dout=7 for addr=51");
        
        addr = 52; #10;
        if (dout !== 1) $display("FAIL: Expected dout=1 for addr=52");
        
        addr = 53; #10;
        if (dout !== 14) $display("FAIL: Expected dout=14 for addr=53");
        
        addr = 54; #10;
        if (dout !== 2) $display("FAIL: Expected dout=2 for addr=54");
        
        addr = 55; #10;
        if (dout !== 13) $display("FAIL: Expected dout=13 for addr=55");
        
        addr = 56; #10;
        if (dout !== 6) $display("FAIL: Expected dout=6 for addr=56");
        
        addr = 57; #10;
        if (dout !== 15) $display("FAIL: Expected dout=15 for addr=57");
        
        addr = 58; #10;
        if (dout !== 0) $display("FAIL: Expected dout=0 for addr=58");
        
        addr = 59; #10;
        if (dout !== 9) $display("FAIL: Expected dout=9 for addr=59");
        
        addr = 60; #10;
        if (dout !== 10) $display("FAIL: Expected dout=10 for addr=60");
        
        addr = 61; #10;
        if (dout !== 4) $display("FAIL: Expected dout=4 for addr=61");
        
        addr = 62; #10;
        if (dout !== 5) $display("FAIL: Expected dout=5 for addr=62");
        
        addr = 63; #10;
        if (dout !== 3) $display("FAIL: Expected dout=3 for addr=63");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule