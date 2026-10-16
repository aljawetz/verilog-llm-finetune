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
    data_i = 4'h0; #10; if (data_o !== 4'hC) $display("FAIL: Input 0 expected output C, got %h", data_o);
    data_i = 4'h1; #10; if (data_o !== 4'h5) $display("FAIL: Input 1 expected output 5, got %h", data_o);
    data_i = 4'h2; #10; if (data_o !== 4'h6) $display("FAIL: Input 2 expected output 6, got %h", data_o);
    data_i = 4'h3; #10; if (data_o !== 4'hB) $display("FAIL: Input 3 expected output B, got %h", data_o);
    data_i = 4'h4; #10; if (data_o !== 4'h9) $display("FAIL: Input 4 expected output 9, got %h", data_o);
    data_i = 4'h5; #10; if (data_o !== 4'h0) $display("FAIL: Input 5 expected output 0, got %h", data_o);
    data_i = 4'h6; #10; if (data_o !== 4'hA) $display("FAIL: Input 6 expected output A, got %h", data_o);
    data_i = 4'h7; #10; if (data_o !== 4'hD) $display("FAIL: Input 7 expected output D, got %h", data_o);
    data_i = 4'h8; #10; if (data_o !== 4'h3) $display("FAIL: Input 8 expected output 3, got %h", data_o);
    data_i = 4'h9; #10; if (data_o !== 4'hE) $display("FAIL: Input 9 expected output E, got %h", data_o);
    data_i = 4'hA; #10; if (data_o !== 4'hF) $display("FAIL: Input A expected output F, got %h", data_o);
    data_i = 4'hB; #10; if (data_o !== 4'h8) $display("FAIL: Input B expected output 8, got %h", data_o);
    data_i = 4'hC; #10; if (data_o !== 4'h4) $display("FAIL: Input C expected output 4, got %h", data_o);
    data_i = 4'hD; #10; if (data_o !== 4'h7) $display("FAIL: Input D expected output 7, got %h", data_o);
    data_i = 4'hE; #10; if (data_o !== 4'h1) $display("FAIL: Input E expected output 1, got %h", data_o);
    data_i = 4'hF; #10; if (data_o !== 4'h2) $display("FAIL: Input F expected output 2, got %h", data_o);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule