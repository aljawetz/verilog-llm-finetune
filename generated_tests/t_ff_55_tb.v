`timescale 1ns/1ps

module tb_t_ff;

reg t;
reg clk;
reg rst;
wire qn;
wire qn_bar;

// Instantiate the module under test (uut)
t_ff uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .qn(qn),
    .qn_bar(qn_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 0; 
    t = 0; 
    #10; // Wait for some time

    // Assert reset
    rst = 1; 
    #10; // Wait for a clock edge

    // Test case 1: T = 0, Q should remain unchanged
    t = 0; 
    #10; // Wait for a clock edge
    if (qn !== 0) begin
        $display("FAIL: Expected qn = 0 after T = 0 with initial qn = 0");
        $finish;
    end

    // Test case 2: T = 1, Q should toggle
    t = 1; 
    #10; // Wait for a clock edge
    if (qn !== 1) begin
        $display("FAIL: Expected qn = 1 after T = 1");
        $finish;
    end

    // Test case 3: T = 0, Q should remain unchanged
    t = 0; 
    #10; // Wait for a clock edge
    if (qn !== 1) begin
        $display("FAIL: Expected qn = 1 after T = 0");
        $finish;
    end

    // Test case 4: T = 1, Q should toggle
    t = 1; 
    #10; // Wait for a clock edge
    if (qn !== 0) begin
        $display("FAIL: Expected qn = 0 after T = 1");
        $finish;
    end

    // Test case 5: Reset the flip-flop
    rst = 0; 
    #10; // Wait for a clock edge
    if (qn !== 0) begin
        $display("FAIL: Expected qn = 0 after reset");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule