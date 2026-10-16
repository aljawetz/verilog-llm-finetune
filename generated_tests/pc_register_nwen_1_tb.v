`timescale 1ns/1ps

module tb_pc_register_nwen;

  // Parameters
  parameter RESET_ADDRESS = 32'h00000000;
  parameter CLK_PERIOD = 10;

  // Inputs
  reg clk;
  reg rst;
  reg nwen;
  reg [31:0] new_pc_value;

  // Outputs
  wire [31:0] pc_value;

  // Instantiate the Unit Under Test (UUT)
  pc_register_nwen #(.RESET_ADDRESS(RESET_ADDRESS)) uut (
    .clk(clk),
    .rst(rst),
    .nwen(nwen),
    .new_pc_value(new_pc_value),
    .pc_value(pc_value)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #(CLK_PERIOD / 2) clk = ~clk;
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    nwen = 1;
    new_pc_value = 32'h00000000;

    // Wait for a clock cycle
    #(CLK_PERIOD);
    
    // Release reset
    rst = 0;

    // Check reset behavior
    if (pc_value !== RESET_ADDRESS) begin
      $display("FAIL: PC value after reset is not correct. Expected: %h, Got: %h", RESET_ADDRESS, pc_value);
      $finish;
    end

    // Test writing new PC value
    new_pc_value = 32'h00000001;
    nwen = 0; // Assert write enable (active low)
    #(CLK_PERIOD);

    if (pc_value !== new_pc_value) begin
      $display("FAIL: PC value after writing new value is not correct. Expected: %h, Got: %h", new_pc_value, pc_value);
      $finish;
    end

    // Test writing another new PC value
    new_pc_value = 32'h00000002;
    #(CLK_PERIOD);

    if (pc_value !== new_pc_value) begin
      $display("FAIL: PC value after writing second new value is not correct. Expected: %h, Got: %h", new_pc_value, pc_value);
      $finish;
    end

    // Test behavior with nwen high (no write)
    nwen = 1; // Deassert write enable
    #(CLK_PERIOD);

    // Check that PC value remains the same
    if (pc_value !== 32'h00000002) begin
      $display("FAIL: PC value changed when nwen is high. Expected: %h, Got: %h", 32'h00000002, pc_value);
      $finish;
    end

    // Test reset functionality again
    rst = 1; // Assert reset
    #(CLK_PERIOD);
    rst = 0; // Release reset
    #(CLK_PERIOD);

    if (pc_value !== RESET_ADDRESS) begin
      $display("FAIL: PC value after reset is not correct. Expected: %h, Got: %h", RESET_ADDRESS, pc_value);
      $finish;
    end

    // Final check with another value
    new_pc_value = 32'h00000003;
    nwen = 0; // Assert write enable
    #(CLK_PERIOD);

    if (pc_value !== new_pc_value) begin
      $display("FAIL: PC value after writing third new value is not correct. Expected: %h, Got: %h", new_pc_value, pc_value);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule