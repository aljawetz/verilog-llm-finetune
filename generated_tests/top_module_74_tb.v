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

        // Test case 1: L = 0, Q should follow q_in
        #10;
        q_in = 1; // Set q_in to 1
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1 when L = 0 and q_in = 1, got Q = %b", Q);
            $finish;
        end

        // Test case 2: L = 1, Q should follow r_in
        #10;
        L = 1; r_in = 0; // Set L to 1 and r_in to 0
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0 when L = 1 and r_in = 0, got Q = %b", Q);
            $finish;
        end

        // Test case 3: Change r_in while L = 1
        #10;
        r_in = 1; // Set r_in to 1
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1 when L = 1 and r_in = 1, got Q = %b", Q);
            $finish;
        end

        // Test case 4: Set L back to 0, Q should follow q_in
        #10;
        L = 0; q_in = 0; // Set L to 0 and q_in to 0
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0 when L = 0 and q_in = 0, got Q = %b", Q);
            $finish;
        end

        // Test case 5: Change q_in to 1
        #10;
        q_in = 1; // Set q_in to 1
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1 when L = 0 and q_in = 1, got Q = %b", Q);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule