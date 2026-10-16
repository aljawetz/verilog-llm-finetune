`timescale 1ns/1ps

module tb_ccs_out_v1;

  parameter integer width = 8;
  
  reg [width-1:0] idat;
  wire [width-1:0] dat;

  // Instantiate the module under test (uut)
  ccs_out_v1 #(.width(width)) uut (
    .dat(dat),
    .idat(idat)
  );

  initial begin
    // Initialize input
    idat = 0;

    // Test sequence
    #10 idat = 8'hAA; // Test with a specific value
    #10 if (dat !== idat) $display("FAIL: Output does not match input at time %0t", $time);
    
    #10 idat = 8'h55; // Test with another specific value
    #10 if (dat !== idat) $display("FAIL: Output does not match input at time %0t", $time);
    
    #10 idat = 8'hFF; // Test with maximum value
    #10 if (dat !== idat) $display("FAIL: Output does not match input at time %0t", $time);
    
    #10 idat = 8'h00; // Test with minimum value
    #10 if (dat !== idat) $display("FAIL: Output does not match input at time %0t", $time);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule