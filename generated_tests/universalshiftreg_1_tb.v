`timescale 1ns/1ps

module tb_universalshiftreg;

reg clk;
reg reset;
reg [7:0] datain;
reg [1:0] mode;
wire [7:0] dataout;

universalshiftreg uut (
    .clk(clk),
    .reset(reset),
    .datain(datain),
    .mode(mode),
    .dataout(dataout)
);

initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    datain = 8'b00000000;
    mode = 2'b00;

    // Release reset after some time
    #10 reset = 0;

    // Test 1: Load data
    mode = 2'b11; datain = 8'b10101010; #10;
    if (dataout !== 8'b10101010) begin
        $display("FAIL: Load data failed");
        $finish;
    end

    // Test 2: Shift left
    mode = 2'b01; #10;
    if (dataout !== 8'b01010100) begin
        $display("FAIL: Left shift failed");
        $finish;
    end

    // Test 3: Shift right
    mode = 2'b10; #10;
    if (dataout !== 8'b00101010) begin
        $display("FAIL: Right shift failed");
        $finish;
    end

    // Test 4: No change
    mode = 2'b00; #10;
    if (dataout !== 8'b00101010) begin
        $display("FAIL: No change failed");
        $finish;
    end

    // Test 5: Reset
    reset = 1; #10;
    reset = 0; #10;
    if (dataout !== 8'b00000000) begin
        $display("FAIL: Reset failed");
        $finish;
    end

    // Test 6: Load new data after reset
    mode = 2'b11; datain = 8'b11110000; #10;
    if (dataout !== 8'b11110000) begin
        $display("FAIL: Load after reset failed");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule