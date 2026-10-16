`timescale 1ns/1ps

module tb_Day27_PIPO;

  reg [3:0] Din;
  reg rst;
  reg clk;
  wire [3:0] Dout;

  // Instantiate the module under test (uut)
  Day27_PIPO uut (
    .Din(Din),
    .rst(rst),
    .clk(clk),
    .Dout(Dout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    Din = 4'b0000;
    rst = 1;
    
    // Wait for a clock edge
    #10;
    
    // Test reset functionality
    if (Dout !== 4'b0000) begin
      $display("FAIL: Dout should be 0 when rst is high");
      $finish;
    end

    // Release reset
    rst = 0;
    Din = 4'b1010; // Test input

    // Wait for a clock edge
    #10;
    
    // Check Dout after loading Din
    if (Dout !== 4'b1010) begin
      $display("FAIL: Dout should be 1010 after loading Din");
      $finish;
    end

    // Change Din and check Dout
    Din = 4'b1100;
    #10;

    if (Dout !== 4'b1100) begin
      $display("FAIL: Dout should be 1100 after loading new Din");
      $finish;
    end

    // Test reset again
    rst = 1;
    #10;

    if (Dout !== 4'b0000) begin
      $display("FAIL: Dout should be 0 when rst is high again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule