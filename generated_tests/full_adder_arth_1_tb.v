`timescale 1ns/1ps

module tb_full_adder_arth;

    // Inputs
    reg a_in;
    reg b_in;
    reg c_in;

    // Outputs
    wire sum_out;
    wire carry_out;

    // Instantiate the Unit Under Test (UUT)
    full_adder_arth uut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .sum_out(sum_out),
        .carry_out(carry_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, carry = 0
        a_in = 0; b_in = 0; c_in = 0;
        #10;
        if (sum_out !== 0 || carry_out !== 0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: 0 + 0 + 1 = 1, carry = 0
        a_in = 0; b_in = 0; c_in = 1;
        #10;
        if (sum_out !== 1 || carry_out !== 0) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: 0 + 1 + 1 = 0, carry = 1
        a_in = 0; b_in = 1; c_in = 1;
        #10;
        if (sum_out !== 0 || carry_out !== 1) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: 1 + 0 + 1 = 0, carry = 1
        a_in = 1; b_in = 0; c_in = 1;
        #10;
        if (sum_out !== 0 || carry_out !== 1) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: 1 + 1 + 0 = 0, carry = 1
        a_in = 1; b_in = 1; c_in = 0;
        #10;
        if (sum_out !== 0 || carry_out !== 1) 
            $display("FAIL: Test case 5 failed");
        
        // Test case 6: 1 + 1 + 1 = 1, carry = 1
        a_in = 1; b_in = 1; c_in = 1;
        #10;
        if (sum_out !== 1 || carry_out !== 1) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule