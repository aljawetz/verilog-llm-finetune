`timescale 1ns/1ps

module tb_Mini_Vending_Machine;

reg clk;
reg rst;
reg [1:0] coin_in;
wire product_out;
wire change_out;

Mini_Vending_Machine uut (
    .clk(clk),
    .rst(rst),
    .coin_in(coin_in),
    .product_out(product_out),
    .change_out(change_out)
);

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    coin_in = 2'b00;

    // Apply reset
    #5 rst = 1; // Release reset
    #5;

    // Test sequence
    // Test state s0 with coin_in = 01
    coin_in = 2'b01; // Insert 1 coin
    #10;
    if (uut.present_state !== 2'b01 || product_out !== 1'b0 || change_out !== 1'b0) 
        $display("FAIL: State s0 with coin_in=01 failed");
    
    // Test state s1 with coin_in = 01
    coin_in = 2'b01; // Insert another 1 coin
    #10;
    if (uut.present_state !== 2'b10 || product_out !== 1'b0 || change_out !== 1'b0) 
        $display("FAIL: State s1 with coin_in=01 failed");
    
    // Test state s2 with coin_in = 10
    coin_in = 2'b10; // Insert 2 coin
    #10;
    if (uut.present_state !== 2'b00 || product_out !== 1'b1 || change_out !== 1'b0) 
        $display("FAIL: State s2 with coin_in=10 failed");
    
    // Test state s2 with coin_in = 10 again
    coin_in = 2'b10; // Insert 2 coin again
    #10;
    if (uut.present_state !== 2'b00 || product_out !== 1'b1 || change_out !== 1'b1) 
        $display("FAIL: State s2 with coin_in=10 for change failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule