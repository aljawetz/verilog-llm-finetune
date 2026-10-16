`timescale 1ns/1ps

module tb_moore;
    reg Data_in;
    reg clk;
    reg rst;
    wire Data_out;

    // Instantiate the module under test (uut)
    moore uut (
        .Data_in(Data_in),
        .Data_out(Data_out),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        Data_in = 0;
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence to check state transitions and outputs
        // Input: 1 -> s1
        Data_in = 1; #10;
        if (uut.current_state !== 3'b001) $display("FAIL: Expected state s1, got %b", uut.current_state);

        // Input: 1 -> s11
        Data_in = 1; #10;
        if (uut.current_state !== 3'b010) $display("FAIL: Expected state s11, got %b", uut.current_state);

        // Input: 0 -> s110
        Data_in = 0; #10;
        if (uut.current_state !== 3'b011) $display("FAIL: Expected state s110, got %b", uut.current_state);

        // Input: 1 -> s101
        Data_in = 1; #10;
        if (uut.current_state !== 3'b101) $display("FAIL: Expected state s101, got %b", uut.current_state);

        // Check output
        if (uut.Data_out !== 1) $display("FAIL: Expected Data_out to be 1, got %b", uut.Data_out);

        // Input: 1 -> s11
        Data_in = 1; #10;
        if (uut.current_state !== 3'b010) $display("FAIL: Expected state s11, got %b", uut.current_state);

        // Input: 0 -> s110
        Data_in = 0; #10;
        if (uut.current_state !== 3'b011) $display("FAIL: Expected state s110, got %b", uut.current_state);

        // Input: 0 -> Idle
        Data_in = 0; #10;
        if (uut.current_state !== 3'b000) $display("FAIL: Expected state Idle, got %b", uut.current_state);

        // Input: 1 -> s1
        Data_in = 1; #10;
        if (uut.current_state !== 3'b001) $display("FAIL: Expected state s1, got %b", uut.current_state);

        // Input: 0 -> Idle
        Data_in = 0; #10;
        if (uut.current_state !== 3'b000) $display("FAIL: Expected state Idle, got %b", uut.current_state);

        // Input: 1 -> s1, 1 -> s11, 0 -> s110, 1 -> s101
        Data_in = 1; #10;
        Data_in = 1; #10;
        Data_in = 0; #10;
        Data_in = 1; #10;
        if (uut.current_state !== 3'b101) $display("FAIL: Expected state s101, got %b", uut.current_state);
        if (uut.Data_out !== 1) $display("FAIL: Expected Data_out to be 1, got %b", uut.Data_out);

        // Finish simulation
        $display("PASS");
        $finish;
    end
endmodule