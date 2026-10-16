`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg clk;
    reg L;
    reg r_in;
    reg q_in;

    // Output
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

        // Wait for the first clock edge
        #10;

        // Test case 1: L = 0, expect Q = q_in
        q_in = 1; 
        #10; // Wait for clock edge
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1 when L = 0 and q_in = 1, but got Q = %b", Q);
            $finish;
        end

        // Test case 2: L = 1, expect Q = r_in
        L = 1; r_in = 0; 
        #10; // Wait for clock edge
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0 when L = 1 and r_in = 0, but got Q = %b", Q);
            $finish;
        end

        // Test case 3: L = 1, expect Q = r_in
        r_in = 1; 
        #10; // Wait for clock edge
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1 when L = 1 and r_in = 1, but got Q = %b", Q);
            $finish;
        end

        // Test case 4: L = 0, expect Q = q_in
        L = 0; q_in = 0; 
        #10; // Wait for clock edge
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0 when L = 0 and q_in = 0, but got Q = %b", Q);
            $finish;
        end

        // Test case 5: L = 0, expect Q = q_in
        q_in = 1; 
        #10; // Wait for clock edge
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1 when L = 0 and q_in = 1, but got Q = %b", Q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule