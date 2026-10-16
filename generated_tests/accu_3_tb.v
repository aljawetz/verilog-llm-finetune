`timescale 1ns/1ps

module tb_accu;

// Testbench signals
reg clk;
reg rst_n;
reg [7:0] data_in;
reg valid_in;
wire valid_out;
wire [9:0] data_out;

// Instantiate the module under test
accu uut (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(data_in),
    .valid_in(valid_in),
    .valid_out(valid_out),
    .data_out(data_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize signals
    rst_n = 0;
    data_in = 8'd0;
    valid_in = 0;

    // Release reset
    #10;
    rst_n = 1;

    // Test case 1: Accumulate 4 inputs
    // Input: 1, 2, 3, 4
    valid_in = 1;
    data_in = 8'd1; #10;
    data_in = 8'd2; #10;
    data_in = 8'd3; #10;
    data_in = 8'd4; #10;

    // Check output
    if (valid_out !== 1'b1 || data_out !== 10'd10) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Reset for next test
    valid_in = 0; #10;
    rst_n = 0; #10;
    rst_n = 1; #10;

    // Test case 2: Accumulate 4 inputs
    // Input: 5, 6, 7, 8
    valid_in = 1;
    data_in = 8'd5; #10;
    data_in = 8'd6; #10;
    data_in = 8'd7; #10;
    data_in = 8'd8; #10;

    // Check output
    if (valid_out !== 1'b1 || data_out !== 10'd26) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Reset for next test
    valid_in = 0; #10;
    rst_n = 0; #10;
    rst_n = 1; #10;

    // Test case 3: Accumulate 4 inputs with larger values
    // Input: 255, 255, 255, 255
    valid_in = 1;
    data_in = 8'd255; #10;
    data_in = 8'd255; #10;
    data_in = 8'd255; #10;
    data_in = 8'd255; #10;

    // Check output
    if (valid_out !== 1'b1 || data_out !== 10'd1020) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Final reset
    valid_in = 0; #10;
    rst_n = 0; #10;
    rst_n = 1; #10;

    // End of test
    $display("PASS");
    $finish;
end

endmodule