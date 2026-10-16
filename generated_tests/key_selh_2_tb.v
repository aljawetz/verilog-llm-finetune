`timescale 1ns/1ps

module tb_key_selh;

    reg [55:0] K;
    reg [3:0] roundSel;
    reg decrypt;
    wire [1:48] K_sub;

    key_selh uut (
        .K_sub(K_sub),
        .K(K),
        .roundSel(roundSel),
        .decrypt(decrypt)
    );

    initial begin
        // Test case 1: Normal operation with encrypt
        K = 56'h0123456789ABCDEF; // Example key
        roundSel = 4'b0000; // First round
        decrypt = 0; // Encrypt mode
        #10;

        if (K_sub !== uut.K1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Normal operation with decrypt
        K = 56'h0123456789ABCDEF; // Same key
        roundSel = 4'b0000; // First round
        decrypt = 1; // Decrypt mode
        #10;

        if (K_sub !== uut.K1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Different round selection
        K = 56'h0123456789ABCDEF; // Same key
        roundSel = 4'b0001; // Second round
        decrypt = 0; // Encrypt mode
        #10;

        if (K_sub !== uut.K2) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Check decrypt with different round
        K = 56'h0123456789ABCDEF; // Same key
        roundSel = 4'b0001; // Second round
        decrypt = 1; // Decrypt mode
        #10;

        if (K_sub !== uut.K2) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Last round selection
        K = 56'h0123456789ABCDEF; // Same key
        roundSel = 4'b0111; // Last round
        decrypt = 0; // Encrypt mode
        #10;

        if (K_sub !== uut.K8) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Last round decrypt
        K = 56'h0123456789ABCDEF; // Same key
        roundSel = 4'b0111; // Last round
        decrypt = 1; // Decrypt mode
        #10;

        if (K_sub !== uut.K8) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule