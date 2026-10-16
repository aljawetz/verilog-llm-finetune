`timescale 1ns/1ps

module tb_n_1mux;

  reg [15:0] in;
  reg [3:0] sel;
  wire y;

  // Instantiate the module under test
  n_1mux uut (
    .in(in),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Test case 1: Select input 0
    in = 16'b1010101010101010; // Input vector
    sel = 4'b0000; // Select first bit
    #10;
    if (y !== in[0]) begin
      $display("FAIL: Expected y = %b, got y = %b", in[0], y);
      $finish;
    end

    // Test case 2: Select input 1
    sel = 4'b0001; // Select second bit
    #10;
    if (y !== in[1]) begin
      $display("FAIL: Expected y = %b, got y = %b", in[1], y);
      $finish;
    end

    // Test case 3: Select input 7
    sel = 4'b0111; // Select eighth bit
    #10;
    if (y !== in[7]) begin
      $display("FAIL: Expected y = %b, got y = %b", in[7], y);
      $finish;
    end

    // Test case 4: Select input 15
    sel = 4'b1111; // Select last bit
    #10;
    if (y !== in[15]) begin
      $display("FAIL: Expected y = %b, got y = %b", in[15], y);
      $finish;
    end

    // Test case 5: Select input 10
    sel = 4'b1010; // Select eleventh bit
    #10;
    if (y !== in[10]) begin
      $display("FAIL: Expected y = %b, got y = %b", in[10], y);
      $finish;
    end

    // Test case 6: Select input 12
    sel = 4'b1100; // Select thirteenth bit
    #10;
    if (y !== in[12]) begin
      $display("FAIL: Expected y = %b, got y = %b", in[12], y);
      $finish;
    end

    // Test case 7: Invalid selection (default case)
    sel = 4'b1110; // Select invalid bit
    #10;
    if (y !== in[14]) begin
      $display("FAIL: Expected y = %b, got y = %b", in[14], y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule