`timescale 1ns/1ps

module tb_base2_mux;

  parameter WIDTH = 16;
  parameter LOG2_WIDTH = 4;

  reg [LOG2_WIDTH-1:0] K;
  wire [WIDTH-1:0] OUT_2K;

  // Instantiate the module under test
  base2_mux #(WIDTH, LOG2_WIDTH) uut (
    .K(K),
    .OUT_2K(OUT_2K)
  );

  initial begin
    // Test cases
    K = 0; #10;
    if (OUT_2K !== 16'h0001) $display("FAIL: Expected OUT_2K = 1 for K = 0");
    
    K = 1; #10;
    if (OUT_2K !== 16'h0002) $display("FAIL: Expected OUT_2K = 2 for K = 1");
    
    K = 2; #10;
    if (OUT_2K !== 16'h0004) $display("FAIL: Expected OUT_2K = 4 for K = 2");
    
    K = 3; #10;
    if (OUT_2K !== 16'h0008) $display("FAIL: Expected OUT_2K = 8 for K = 3");
    
    K = 4; #10;
    if (OUT_2K !== 16'h0010) $display("FAIL: Expected OUT_2K = 16 for K = 4");
    
    K = 5; #10;
    if (OUT_2K !== 16'h0020) $display("FAIL: Expected OUT_2K = 32 for K = 5");
    
    K = 6; #10;
    if (OUT_2K !== 16'h0040) $display("FAIL: Expected OUT_2K = 64 for K = 6");
    
    K = 7; #10;
    if (OUT_2K !== 16'h0080) $display("FAIL: Expected OUT_2K = 128 for K = 7");
    
    K = 8; #10;
    if (OUT_2K !== 16'h0100) $display("FAIL: Expected OUT_2K = 256 for K = 8");
    
    K = 9; #10;
    if (OUT_2K !== 16'h0200) $display("FAIL: Expected OUT_2K = 512 for K = 9");
    
    K = 10; #10;
    if (OUT_2K !== 16'h0400) $display("FAIL: Expected OUT_2K = 1024 for K = 10");
    
    K = 11; #10;
    if (OUT_2K !== 16'h0800) $display("FAIL: Expected OUT_2K = 2048 for K = 11");
    
    K = 12; #10;
    if (OUT_2K !== 16'h1000) $display("FAIL: Expected OUT_2K = 4096 for K = 12");
    
    K = 13; #10;
    if (OUT_2K !== 16'h2000) $display("FAIL: Expected OUT_2K = 8192 for K = 13");
    
    K = 14; #10;
    if (OUT_2K !== 16'h4000) $display("FAIL: Expected OUT_2K = 16384 for K = 14");
    
    K = 15; #10;
    if (OUT_2K !== 16'h8000) $display("FAIL: Expected OUT_2K = 32768 for K = 15");

    $display("PASS");
    $finish;
  end

endmodule