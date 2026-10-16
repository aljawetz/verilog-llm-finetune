`timescale 1ns/1ps

module tb_sr_ff;

reg clk;
reg rst;
reg S;
reg R;
wire q;
wire q_bar;

// Instantiate the SR flip-flop
sr_ff uut (
    .clk(clk),
    .rst(rst),
    .S(S),
    .R(R),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    S = 0;
    R = 0;

    // Test 1: Reset the flip-flop
    rst = 1; // Active reset
    #10;
    if (q !== 1'b0 || q_bar !== 1'b1) begin
        $display("FAIL: Reset did not clear outputs");
        $finish;
    end

    // Test 2: Set the flip-flop
    rst = 0; // Deactivate reset
    S = 1; R = 0; // Set condition
    #10;
    if (q !== 1'b1 || q_bar !== 1'b0) begin
        $display("FAIL: Set condition failed");
        $finish;
    end

    // Test 3: Reset the flip-flop
    S = 0; R = 1; // Reset condition
    #10;
    if (q !== 1'b0 || q_bar !== 1'b1) begin
        $display("FAIL: Reset condition failed");
        $finish;
    end

    // Test 4: Hold state
    S = 0; R = 0; // Hold condition
    #10;
    if (q !== 1'b0 || q_bar !== 1'b1) begin
        $display("FAIL: Hold condition failed");
        $finish;
    end

    // Test 5: Indeterminate state
    S = 1; R = 1; // Indeterminate condition
    #10;
    if (q !== 1'bx || q_bar !== 1'bx) begin
        $display("FAIL: Indeterminate condition failed");
        $finish;
    end

    // Test 6: Reset again
    rst = 1; // Active reset
    #10;
    if (q !== 1'b0 || q_bar !== 1'b1) begin
        $display("FAIL: Reset did not clear outputs");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule