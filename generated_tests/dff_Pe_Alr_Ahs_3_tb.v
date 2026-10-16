`timescale 1ns/1ps

module tb_dff_Pe_Alr_Ahs;

reg d;
reg clk;
reg rst;
reg set;
wire q;

// Instantiate the module under test (uut)
dff_Pe_Alr_Ahs uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst),
    .set(set)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    d = 0;
    rst = 1;
    set = 0;

    // Test 1: Reset the flip-flop
    rst = 0; // Assert reset
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Set the flip-flop
    rst = 1; // Deassert reset
    set = 1; // Assert set
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Set did not set q to 1");
        $finish;
    end

    // Test 3: Check D input on clock edge
    set = 0; // Deassert set
    d = 1;   // Set D to 1
    #10;     // Wait for clock edge
    if (q !== 1'b1) begin
        $display("FAIL: D input was not captured on clock edge");
        $finish;
    end

    // Test 4: Change D input and check
    d = 0;   // Change D to 0
    #10;     // Wait for clock edge
    if (q !== 1'b0) begin
        $display("FAIL: D input change was not captured on clock edge");
        $finish;
    end

    // Test 5: Assert reset again
    rst = 0; // Assert reset
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0 again");
        $finish;
    end

    // Test 6: Set after reset
    rst = 1; // Deassert reset
    set = 1; // Assert set
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Set did not set q to 1 after reset");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule