`timescale 1ns/1ps

module tb_universal_shift_register;

reg clk;
reg rst;
reg load;
reg rs;
reg ls;
reg [3:0] in;
wire [3:0] out;

// Instantiate the module under test (uut)
universal_shift_register uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .in(in),
    .out(out),
    .rs(rs),
    .ls(ls)
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
    load = 0;
    rs = 0;
    ls = 0;
    in = 4'b0000;

    // Release reset
    #10;
    rst = 0;

    // Test loading a value
    in = 4'b1010; // Load value 1010
    load = 1;
    #10;
    load = 0;
    if (out !== 4'b1010) begin
        $display("FAIL: Load operation failed. Expected 1010, got %b", out);
        $finish;
    end

    // Test left shift
    ls = 1;
    #10;
    ls = 0;
    if (out !== 4'b0100) begin
        $display("FAIL: Left shift operation failed. Expected 0100, got %b", out);
        $finish;
    end

    // Test right shift
    rs = 1;
    #10;
    rs = 0;
    if (out !== 4'b0010) begin
        $display("FAIL: Right shift operation failed. Expected 0010, got %b", out);
        $finish;
    end

    // Test asynchronous reset
    rst = 1;
    #10;
    rst = 0;
    if (out !== 4'b0000) begin
        $display("FAIL: Asynchronous reset failed. Expected 0000, got %b", out);
        $finish;
    end

    // Test loading another value
    in = 4'b1111; // Load value 1111
    load = 1;
    #10;
    load = 0;
    if (out !== 4'b1111) begin
        $display("FAIL: Load operation failed. Expected 1111, got %b", out);
        $finish;
    end

    // Final left shift
    ls = 1;
    #10;
    ls = 0;
    if (out !== 4'b1110) begin
        $display("FAIL: Left shift operation failed. Expected 1110, got %b", out);
        $finish;
    end

    // Final right shift
    rs = 1;
    #10;
    rs = 0;
    if (out !== 4'b0111) begin
        $display("FAIL: Right shift operation failed. Expected 0111, got %b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule