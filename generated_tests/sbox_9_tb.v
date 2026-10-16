`timescale 1ns/1ps

module tb_sbox;

//- Testbench Signals --------------------------------------------------------
reg [3:0] data_i;
wire [3:0] data_o;

//- Instantiate the Unit Under Test (UUT) -----------------------------------
sbox uut (
    .data_o(data_o),
    .data_i(data_i)
);

//- Test Procedure ------------------------------------------------------------
initial begin
    // Test all possible inputs
    data_i = 4'h0; #10;
    if (data_o !== 4'hC) $display("FAIL: Expected 4'hC for input 4'h0, got %h", data_o);

    data_i = 4'h1; #10;
    if (data_o !== 4'h5) $display("FAIL: Expected 4'h5 for input 4'h1, got %h", data_o);

    data_i = 4'h2; #10;
    if (data_o !== 4'h6) $display("FAIL: Expected 4'h6 for input 4'h2, got %h", data_o);

    data_i = 4'h3; #10;
    if (data_o !== 4'hB) $display("FAIL: Expected 4'hB for input 4'h3, got %h", data_o);

    data_i = 4'h4; #10;
    if (data_o !== 4'h9) $display("FAIL: Expected 4'h9 for input 4'h4, got %h", data_o);

    data_i = 4'h5; #10;
    if (data_o !== 4'h0) $display("FAIL: Expected 4'h0 for input 4'h5, got %h", data_o);

    data_i = 4'h6; #10;
    if (data_o !== 4'hA) $display("FAIL: Expected 4'hA for input 4'h6, got %h", data_o);

    data_i = 4'h7; #10;
    if (data_o !== 4'hD) $display("FAIL: Expected 4'hD for input 4'h7, got %h", data_o);

    data_i = 4'h8; #10;
    if (data_o !== 4'h3) $display("FAIL: Expected 4'h3 for input 4'h8, got %h", data_o);

    data_i = 4'h9; #10;
    if (data_o !== 4'hE) $display("FAIL: Expected 4'hE for input 4'h9, got %h", data_o);

    data_i = 4'hA; #10;
    if (data_o !== 4'hF) $display("FAIL: Expected 4'hF for input 4'hA, got %h", data_o);

    data_i = 4'hB; #10;
    if (data_o !== 4'h8) $display("FAIL: Expected 4'h8 for input 4'hB, got %h", data_o);

    data_i = 4'hC; #10;
    if (data_o !== 4'h4) $display("FAIL: Expected 4'h4 for input 4'hC, got %h", data_o);

    data_i = 4'hD; #10;
    if (data_o !== 4'h7) $display("FAIL: Expected 4'h7 for input 4'hD, got %h", data_o);

    data_i = 4'hE; #10;
    if (data_o !== 4'h1) $display("FAIL: Expected 4'h1 for input 4'hE, got %h", data_o);

    data_i = 4'hF; #10;
    if (data_o !== 4'h2) $display("FAIL: Expected 4'h2 for input 4'hF, got %h", data_o);

    $display("PASS");
    $finish;
end

endmodule