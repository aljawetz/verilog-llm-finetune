`timescale 1ns/1ps

module tb_dff_s;

reg d, clk, rst, set;
wire q;

// Instantiate the module under test
dff_s uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst),
    .set(set)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    set = 0;
    d = 0;

    // Apply reset
    #10 rst = 1; // Release reset
    #10;

    // Test 1: Check reset functionality
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Check set functionality
    set = 1; // Set the flip-flop
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Set did not set q to 1");
        $finish;
    end
    set = 0; // Release set

    // Test 3: Check data input functionality
    d = 1; // Set data to 1
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow d when set to 1");
        $finish;
    end

    // Test 4: Change data input
    d = 0; // Set data to 0
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: q did not follow d when set to 0");
        $finish;
    end

    // Test 5: Check behavior on rising edge of clk
    d = 1; // Set data to 1
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow d on rising edge of clk");
        $finish;
    end

    // Test 6: Check reset during operation
    rst = 0; // Assert reset
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0 during operation");
        $finish;
    end
    rst = 1; // Release reset

    // Test 7: Check set during operation
    set = 1; // Assert set
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Set did not set q to 1 during operation");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule