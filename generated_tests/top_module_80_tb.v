`timescale 1ns/1ps

module tb_top_module;

    reg clk;
    reg L;
    reg r_in;
    reg q_in;
    wire Q;

    // Instantiate the module under test (uut)
    top_module uut (
        .clk(clk),
        .L(L),
        .r_in(r_in),
        .q_in(q_in),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        L = 0; r_in = 0; q_in = 0;

        // Test case 1: L = 0, expect Q to follow q_in
        #10; 
        q_in = 1; 
        #10; 
        if (Q !== 1) $display("FAIL: Test case 1 failed, expected Q = 1, got Q = %b", Q);

        // Test case 2: L = 0, expect Q to follow q_in
        #10; 
        q_in = 0; 
        #10; 
        if (Q !== 0) $display("FAIL: Test case 2 failed, expected Q = 0, got Q = %b", Q);

        // Test case 3: L = 1, expect Q to follow r_in
        #10; 
        L = 1; r_in = 1; 
        #10; 
        if (Q !== 1) $display("FAIL: Test case 3 failed, expected Q = 1, got Q = %b", Q);

        // Test case 4: L = 1, expect Q to follow r_in
        #10; 
        r_in = 0; 
        #10; 
        if (Q !== 0) $display("FAIL: Test case 4 failed, expected Q = 0, got Q = %b", Q);

        // Test case 5: L = 0, q_in = 1, expect Q to follow q_in
        #10; 
        L = 0; q_in = 1; 
        #10; 
        if (Q !== 1) $display("FAIL: Test case 5 failed, expected Q = 1, got Q = %b", Q);

        // Test case 6: L = 0, q_in = 0, expect Q to follow q_in
        #10; 
        q_in = 0; 
        #10; 
        if (Q !== 0) $display("FAIL: Test case 6 failed, expected Q = 0, got Q = %b", Q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule