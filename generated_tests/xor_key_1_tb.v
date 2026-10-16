`timescale 1ns/1ps

module tb_xor_key;

    reg [47:0] data_r_exp;
    reg [47:0] key;
    wire [47:0] data_r_proc;

    // Instantiate the module under test (uut)
    xor_key uut (
        .data_r_exp(data_r_exp),
        .key(key),
        .data_r_proc(data_r_proc)
    );

    initial begin
        // Test case 1: Simple XOR operation
        data_r_exp = 48'hFFFFFFFFFFFF; // All bits set
        key = 48'h000000000000;        // All bits clear
        #10; // Wait for the output to settle
        if (data_r_proc !== 48'hFFFFFFFFFFFF) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: XOR with a pattern
        data_r_exp = 48'hA5A5A5A5A5A5; // Pattern
        key = 48'h5A5A5A5A5A5A;        // Inverted pattern
        #10; // Wait for the output to settle
        if (data_r_proc !== 48'hFFFFFFFFFFFF) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: XOR with zero
        data_r_exp = 48'h123456789ABC; // Some data
        key = 48'h000000000000;        // All bits clear
        #10; // Wait for the output to settle
        if (data_r_proc !== 48'h123456789ABC) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: XOR with itself
        data_r_exp = 48'hDEADBEEFCAFE; // Some data
        key = 48'hDEADBEEFCAFE;        // Same data
        #10; // Wait for the output to settle
        if (data_r_proc !== 48'h000000000000) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Random values
        data_r_exp = 48'h123456789ABC;
        key = 48'hFEDCBA987654;
        #10; // Wait for the output to settle
        if (data_r_proc !== (data_r_exp ^ key)) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule