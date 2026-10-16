`timescale 1ns/1ps

module tb_lfsr_32bit1_rup;
  reg clk;
  reg rst;
  wire lout1;
  
  // Instantiate the module under test (uut)
  lfsr_32bit1_rup uut (
    .clk(clk),
    .rst(rst),
    .lout1(lout1)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Reset the LFSR
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;
    
    // Check the initial output after reset
    if (uut.out !== 32'h6E8DABC5) begin
      $display("FAIL: Initial output is incorrect after reset");
      $finish;
    end

    // Allow some clock cycles to pass
    #10; // Wait for 10ns
    
    // Check the output after a few clock cycles
    if (lout1 !== 1'b1) begin
      $display("FAIL: Output lout1 is incorrect after first clock cycle");
      $finish;
    end

    // Continue to check outputs for a number of cycles
    repeat (10) begin
      #10; // Wait for 10ns for each clock cycle
      // Check the output
      if (lout1 !== (uut.out[31])) begin
        $display("FAIL: Output lout1 is incorrect at clock cycle");
        $finish;
      end
    end

    // Reset the LFSR again
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;

    // Check the output after reset again
    if (uut.out !== 32'h6E8DABC5) begin
      $display("FAIL: Output is incorrect after second reset");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule