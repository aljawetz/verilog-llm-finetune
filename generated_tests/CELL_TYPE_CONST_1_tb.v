`timescale 1ns/1ps

module tb_CELL_TYPE_CONST;

  // Parameters for the testbench
  parameter PARAM_WIDTH = 8;
  parameter PARAM_INIT_VALUE = 8'hA5; // Example initial value

  // Instantiate the module under test (uut)
  wire [PARAM_WIDTH - 1 : 0] PORT_ID_OUT;
  CELL_TYPE_CONST #(PARAM_WIDTH, PARAM_INIT_VALUE) uut (
    .PORT_ID_OUT(PORT_ID_OUT)
  );

  // Test procedure
  initial begin
    // Wait for some time to observe the output
    #10;

    // Check if the output is as expected
    if (PORT_ID_OUT !== PARAM_INIT_VALUE) begin
      $display("FAIL: Output does not match expected value. Expected: %h, Got: %h", PARAM_INIT_VALUE, PORT_ID_OUT);
      $finish;
    end

    // If the output is correct
    $display("PASS");
    $finish;
  end

endmodule