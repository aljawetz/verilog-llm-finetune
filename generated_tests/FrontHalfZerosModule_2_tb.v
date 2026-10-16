`timescale 1ns/1ps

module tb_FrontHalfZerosModule;

  reg [15:0] data_i;
  wire flag_o;
  wire [16:0] codeword_o;

  // Instantiate the module under test (uut)
  FrontHalfZerosModule uut (
    .data_i(data_i),
    .flag_o(flag_o),
    .codeword_o(codeword_o)
  );

  initial begin
    // Test case 1: data_i = 16'h0000
    data_i = 16'h0000; // Upper half is zero
    #10;
    if (flag_o !== 1'b1 || codeword_o !== {4'b0001, 8'h00, 5'b00000}) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: data_i = 16'h00FF
    data_i = 16'h00FF; // Upper half is zero
    #10;
    if (flag_o !== 1'b1 || codeword_o !== {4'b0001, 8'hFF, 5'b00000}) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: data_i = 16'hFF00
    data_i = 16'hFF00; // Upper half is not zero
    #10;
    if (flag_o !== 1'b0 || codeword_o !== {1'b0, 16'hFF00}) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: data_i = 16'h1234
    data_i = 16'h1234; // Upper half is not zero
    #10;
    if (flag_o !== 1'b0 || codeword_o !== {1'b0, 16'h1234}) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: data_i = 16'h0001
    data_i = 16'h0001; // Upper half is zero
    #10;
    if (flag_o !== 1'b1 || codeword_o !== {4'b0001, 8'h01, 5'b00000}) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule