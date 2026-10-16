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

    // Test 1: Reset functionality
    rst = 0; // Assert reset
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Set functionality
    rst = 1; // Deassert reset
    set = 1; // Assert set
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Set did not set q to 1");
        $finish;
    end

    // Test 3: D flip-flop functionality
    set = 0; // Deassert set
    d = 1;   // Set d to 1
    #10;     // Wait for clock edge
    if (q !== 1'b1) begin
        $display("FAIL: D flip-flop did not capture d on clock edge");
        $finish;
    end

    // Test 4: Change d and check output
    d = 0;   // Change d to 0
    #10;     // Wait for clock edge
    if (q !== 1'b0) begin
        $display("FAIL: D flip-flop did not capture new d value on clock edge");
        $finish;
    end

    // Test 5: Reset while clock is high
    rst = 0; // Assert reset
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0 during clock high");
        $finish;
    end

    // Test 6: Set while clock is high
    rst = 1; // Deassert reset
    set = 1; // Assert set
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Set did not set q to 1 during clock high");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule