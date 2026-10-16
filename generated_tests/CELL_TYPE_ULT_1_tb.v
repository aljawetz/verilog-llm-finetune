`timescale 1ns/1ps

module tb_CELL_TYPE_ULT;

  parameter PARAM_WIDTH = 4; // Example width
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN0;
  reg [PARAM_WIDTH - 1 : 0] PORT_ID_IN1;
  wire [0 : 0] PORT_ID_OUT;

  // Instantiate the module under test (uut)
  CELL_TYPE_ULT #(PARAM_WIDTH) uut (
    .PORT_ID_IN0(PORT_ID_IN0),
    .PORT_ID_IN1(PORT_ID_IN1),
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  initial begin
    // Test case 1: 0 < 1
    PORT_ID_IN0 = 4'b0000; 
    PORT_ID_IN1 = 4'b0001; 
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 1 failed (0 < 1)");
      $finish;
    end

    // Test case 2: 1 < 2
    PORT_ID_IN0 = 4'b0001; 
    PORT_ID_IN1 = 4'b0010; 
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 2 failed (1 < 2)");
      $finish;
    end

    // Test case 3: 2 < 2
    PORT_ID_IN0 = 4'b0010; 
    PORT_ID_IN1 = 4'b0010; 
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 3 failed (2 < 2)");
      $finish;
    end

    // Test case 4: 3 < 2
    PORT_ID_IN0 = 4'b0011; 
    PORT_ID_IN1 = 4'b0010; 
    #10;
    if (PORT_ID_OUT !== 1'b0) begin
      $display("FAIL: Test case 4 failed (3 < 2)");
      $finish;
    end

    // Test case 5: 2 < 3
    PORT_ID_IN0 = 4'b0010; 
    PORT_ID_IN1 = 4'b0011; 
    #10;
    if (PORT_ID_OUT !== 1'b1) begin
      $display("FAIL: Test case 5 failed (2 < 3)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule