`timescale 1ns/1ps

module tb_universal_shift_reg;

reg [3:0] p_in;
wire [3:0] p_out;
reg s_right_in;
wire s_right_out;
reg s_left_in;
wire s_left_out;
reg clk;
reg rst;
reg [1:0] sel;

universal_shift_reg uut (
    .p_in(p_in),
    .p_out(p_out),
    .s_right_in(s_right_in),
    .s_right_out(s_right_out),
    .s_left_in(s_left_in),
    .s_left_out(s_left_out),
    .clk(clk),
    .rst(rst),
    .sel(sel)
);

initial begin
    clk = 0;
    rst = 1;
    s_right_in = 0;
    s_left_in = 0;
    p_in = 4'b0000;
    sel = 2'b00;

    #5 rst = 0; // Release reset
    #5;

    // Test Load Parallel
    p_in = 4'b1010; sel = 2'b11; // Load 1010
    #10;
    if (p_out !== 4'b1010) $display("FAIL: Expected p_out = 1010, got %b", p_out);

    // Test Shift Right
    s_right_in = 1; sel = 2'b01; // Shift right with 1
    #10;
    if (p_out !== 4'b1101) $display("FAIL: Expected p_out = 1101, got %b", p_out);
    
    // Test Shift Left
    s_left_in = 1; sel = 2'b10; // Shift left with 1
    #10;
    if (p_out !== 4'b1011) $display("FAIL: Expected p_out = 1011, got %b", p_out);

    // Test Hold
    sel = 2'b00; // Hold
    #10;
    if (p_out !== 4'b1011) $display("FAIL: Expected p_out = 1011, got %b", p_out);

    // Test Asynchronous Reset
    rst = 1; #5;
    if (p_out !== 4'b0000) $display("FAIL: Expected p_out = 0000 after reset, got %b", p_out);
    
    // End of tests
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule