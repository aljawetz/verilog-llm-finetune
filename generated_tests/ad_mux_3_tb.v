`timescale 1ns/1ps

module tb_ad_mux;

    reg [15:0] addr;
    reg [2:0] S;
    reg [15:0] D_out;
    wire [3:0] ad_out;

    // Instantiate the module under test (uut)
    ad_mux uut (
        .addr(addr),
        .S(S),
        .D_out(D_out),
        .ad_out(ad_out)
    );

    initial begin
        // Test case 1: Select lowest nibble of D_out
        addr = 16'h0000; D_out = 16'hABCD; S = 3'b000; #10;
        if (ad_out !== 4'hD) $display("FAIL: Test case 1 failed");

        // Test case 2: Select second nibble of D_out
        addr = 16'h0000; D_out = 16'hABCD; S = 3'b001; #10;
        if (ad_out !== 4'hC) $display("FAIL: Test case 2 failed");

        // Test case 3: Select third nibble of D_out
        addr = 16'h0000; D_out = 16'hABCD; S = 3'b010; #10;
        if (ad_out !== 4'hB) $display("FAIL: Test case 3 failed");

        // Test case 4: Select highest nibble of D_out
        addr = 16'h0000; D_out = 16'hABCD; S = 3'b011; #10;
        if (ad_out !== 4'hA) $display("FAIL: Test case 4 failed");

        // Test case 5: Select lowest nibble of addr
        addr = 16'h1234; D_out = 16'h0000; S = 3'b100; #10;
        if (ad_out !== 4'h4) $display("FAIL: Test case 5 failed");

        // Test case 6: Select second nibble of addr
        addr = 16'h1234; D_out = 16'h0000; S = 3'b101; #10;
        if (ad_out !== 4'h3) $display("FAIL: Test case 6 failed");

        // Test case 7: Select third nibble of addr
        addr = 16'h1234; D_out = 16'h0000; S = 3'b110; #10;
        if (ad_out !== 4'h2) $display("FAIL: Test case 7 failed");

        // Test case 8: Select highest nibble of addr
        addr = 16'h1234; D_out = 16'h0000; S = 3'b111; #10;
        if (ad_out !== 4'h1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule