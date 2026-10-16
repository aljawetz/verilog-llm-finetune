`timescale 1ns/1ps

module tb_parity_check;

    // Inputs
    reg parity_bit;
    reg sampled_data;
    reg parity_check_enable;

    // Outputs
    wire parity_err;

    // Instantiate the Unit Under Test (UUT)
    parity_check uut (
        .parity_bit(parity_bit),
        .sampled_data(sampled_data),
        .parity_check_enable(parity_check_enable),
        .parity_err(parity_err)
    );

    initial begin
        // Test case 1: Parity check enabled, matching parity
        parity_bit = 0; 
        sampled_data = 0; 
        parity_check_enable = 1;
        #10;
        if (parity_err !== 0) $display("FAIL: Test case 1 failed"); 

        // Test case 2: Parity check enabled, mismatching parity
        parity_bit = 0; 
        sampled_data = 1; 
        parity_check_enable = 1;
        #10;
        if (parity_err !== 1) $display("FAIL: Test case 2 failed"); 

        // Test case 3: Parity check disabled
        parity_bit = 1; 
        sampled_data = 0; 
        parity_check_enable = 0;
        #10;
        if (parity_err !== 1) $display("FAIL: Test case 3 failed"); 

        // Test case 4: Parity check enabled, matching parity
        parity_bit = 1; 
        sampled_data = 1; 
        parity_check_enable = 1;
        #10;
        if (parity_err !== 0) $display("FAIL: Test case 4 failed"); 

        // Test case 5: Parity check disabled
        parity_bit = 0; 
        sampled_data = 1; 
        parity_check_enable = 0;
        #10;
        if (parity_err !== 1) $display("FAIL: Test case 5 failed"); 

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule