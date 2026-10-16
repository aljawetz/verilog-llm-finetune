`timescale 1ns/1ps

module tb_lift;

reg clk;
reg rst;
reg ra;
reg rb;
reg rc;
reg rd;
wire [2:0] floor;

// Instantiate the lift module
lift uut (
    .clk(clk),
    .rst(rst),
    .ra(ra),
    .rb(rb),
    .rc(rc),
    .rd(rd),
    .floor(floor)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1;
    ra = 0;
    rb = 0;
    rc = 0;
    rd = 0;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: Check initial state
    if (floor !== 3'b000) begin
        $display("FAIL: Initial state is not A");
        $finish;
    end

    // Test case 2: Request to go to BU
    rb = 1; #10;
    if (floor !== 3'b001) begin
        $display("FAIL: Failed to go to BU from A");
        $finish;
    end
    rb = 0; // Clear request

    // Test case 3: Request to go to CU
    rc = 1; #10;
    if (floor !== 3'b011) begin
        $display("FAIL: Failed to go to CU from BU");
        $finish;
    end
    rc = 0; // Clear request

    // Test case 4: Request to go to D
    rd = 1; #10;
    if (floor !== 3'b101) begin
        $display("FAIL: Failed to go to D from CU");
        $finish;
    end
    rd = 0; // Clear request

    // Test case 5: Request to go to CD
    rc = 1; #10;
    if (floor !== 3'b100) begin
        $display("FAIL: Failed to go to CD from D");
        $finish;
    end
    rc = 0; // Clear request

    // Test case 6: Request to go to BD
    rb = 1; #10;
    if (floor !== 3'b010) begin
        $display("FAIL: Failed to go to BD from CD");
        $finish;
    end
    rb = 0; // Clear request

    // Test case 7: Request to go back to A
    ra = 1; #10;
    if (floor !== 3'b000) begin
        $display("FAIL: Failed to go back to A from BD");
        $finish;
    end
    ra = 0; // Clear request

    // All tests passed
    $display("PASS");
    $finish;
end

endmodule