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
    // Test case 1: Select first bit
    in = 16'b1010101010101010; // Input vector
    sel = 4'b0000;             // Select first bit
    #10;
    if (y !== in[0]) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], y);
      $finish;
    end

    // Test case 2: Select second bit
    sel = 4'b0001;             // Select second bit
    #10;
    if (y !== in[1]) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], y);
      $finish;
    end

    // Test case 3: Select last bit
    sel = 4'b1111;             // Select last bit
    #10;
    if (y !== in[15]) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", in[15], y);
      $finish;
    end

    // Test case 4: Select a middle bit
    sel = 4'b0110;             // Select sixth bit
    #10;
    if (y !== in[6]) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", in[6], y);
      $finish;
    end

    // Test case 5: Select an invalid case
    sel = 4'b1110;             // Select second last bit
    #10;
    if (y !== in[14]) begin
      $display("FAIL: Test case 5 failed, expected %b, got %b", in[14], y);
      $finish;
    end

    // Test case 6: Default case (invalid select)
    sel = 4'b1101;             // Select 13th bit
    #10;
    if (y !== in[13]) begin
      $display("FAIL: Test case 6 failed, expected %b, got %b", in[13], y);
      $finish;
    end

    // Test case 7: Check default case
    sel = 4'b1111;             // Select last bit
    #10;
    if (y !== in[15]) begin
      $display("FAIL: Test case 7 failed, expected %b, got %b", in[15], y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule