`timescale 1ns/1ps

module tb_sbox;

//- Testbench Signals ---------------------------------------------------------
reg [3:0] data_i;
wire [3:0] data_o;

//- Instantiate the Unit Under Test (UUT) ------------------------------------
sbox uut (
    .data_o(data_o),
    .data_i(data_i)
);

//- Test Procedure -------------------------------------------------------------
initial begin
    // Test all possible inputs
    data_i = 4'h0; #10;
    if (data_o !== 4'hC) $display("FAIL: Input 0 produced output %h instead of %h", data_o, 4'hC);
    
    data_i = 4'h1; #10;
    if (data_o !== 4'h5) $display("FAIL: Input 1 produced output %h instead of %h", data_o, 4'h5);
    
    data_i = 4'h2; #10;
    if (data_o !== 4'h6) $display("FAIL: Input 2 produced output %h instead of %h", data_o, 4'h6);
    
    data_i = 4'h3; #10;
    if (data_o !== 4'hB) $display("FAIL: Input 3 produced output %h instead of %h", data_o, 4'hB);
    
    data_i = 4'h4; #10;
    if (data_o !== 4'h9) $display("FAIL: Input 4 produced output %h instead of %h", data_o, 4'h9);
    
    data_i = 4'h5; #10;
    if (data_o !== 4'h0) $display("FAIL: Input 5 produced output %h instead of %h", data_o, 4'h0);
    
    data_i = 4'h6; #10;
    if (data_o !== 4'hA) $display("FAIL: Input 6 produced output %h instead of %h", data_o, 4'hA);
    
    data_i = 4'h7; #10;
    if (data_o !== 4'hD) $display("FAIL: Input 7 produced output %h instead of %h", data_o, 4'hD);
    
    data_i = 4'h8; #10;
    if (data_o !== 4'h3) $display("FAIL: Input 8 produced output %h instead of %h", data_o, 4'h3);
    
    data_i = 4'h9; #10;
    if (data_o !== 4'hE) $display("FAIL: Input 9 produced output %h instead of %h", data_o, 4'hE);
    
    data_i = 4'hA; #10;
    if (data_o !== 4'hF) $display("FAIL: Input A produced output %h instead of %h", data_o, 4'hF);
    
    data_i = 4'hB; #10;
    if (data_o !== 4'h8) $display("FAIL: Input B produced output %h instead of %h", data_o, 4'h8);
    
    data_i = 4'hC; #10;
    if (data_o !== 4'h4) $display("FAIL: Input C produced output %h instead of %h", data_o, 4'h4);
    
    data_i = 4'hD; #10;
    if (data_o !== 4'h7) $display("FAIL: Input D produced output %h instead of %h", data_o, 4'h7);
    
    data_i = 4'hE; #10;
    if (data_o !== 4'h1) $display("FAIL: Input E produced output %h instead of %h", data_o, 4'h1);
    
    data_i = 4'hF; #10;
    if (data_o !== 4'h2) $display("FAIL: Input F produced output %h instead of %h", data_o, 4'h2);
    
    $display("PASS");
    $finish;
end

endmodule