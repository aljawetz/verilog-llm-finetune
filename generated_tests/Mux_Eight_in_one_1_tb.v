`timescale 1ns/1ps

module tb_Mux_Eight_in_one;

  reg [7:0] data;
  reg [2:0] select;
  reg rst;
  reg clk;
  wire out;

  // Instantiate the module under test
  Mux_Eight_in_one uut (
    .data(data),
    .select(select),
    .rst(rst),
    .clk(clk),
    .out(out)
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
    data = 8'b00000000;
    select = 3'b000;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: Check output for each data input
    data = 8'b10101010; // Set data inputs
    #10; select = 3'b000; #10; if (out !== data[0]) $display("FAIL: Expected %b, got %b for select %b", data[0], out, select);
    #10; select = 3'b001; #10; if (out !== data[1]) $display("FAIL: Expected %b, got %b for select %b", data[1], out, select);
    #10; select = 3'b010; #10; if (out !== data[2]) $display("FAIL: Expected %b, got %b for select %b", data[2], out, select);
    #10; select = 3'b011; #10; if (out !== data[3]) $display("FAIL: Expected %b, got %b for select %b", data[3], out, select);
    #10; select = 3'b100; #10; if (out !== data[4]) $display("FAIL: Expected %b, got %b for select %b", data[4], out, select);
    #10; select = 3'b101; #10; if (out !== data[5]) $display("FAIL: Expected %b, got %b for select %b", data[5], out, select);
    #10; select = 3'b110; #10; if (out !== data[6]) $display("FAIL: Expected %b, got %b for select %b", data[6], out, select);
    #10; select = 3'b111; #10; if (out !== data[7]) $display("FAIL: Expected %b, got %b for select %b", data[7], out, select);

    // Test case 2: Check reset functionality
    #10; rst = 1; #10; rst = 0; // Assert and de-assert reset
    #10; select = 3'b000; #10; if (out !== 0) $display("FAIL: Expected output to be 0 after reset, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule