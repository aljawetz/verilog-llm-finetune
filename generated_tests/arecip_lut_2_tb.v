`timescale 1ns/1ps

module tb_arecip_lut;

  reg [6:0] b_i;
  wire [8:0] r_o;

  // Instantiate the module under test
  arecip_lut uut (
    .b_i(b_i),
    .r_o(r_o)
  );

  initial begin
    // Test cases
    // Expected outputs based on the LUT
    b_i = 7'd0; #10; if (r_o !== 9'd508) $display("FAIL: Expected 508 for input 0, got %d", r_o); 
    b_i = 7'd1; #10; if (r_o !== 9'd500) $display("FAIL: Expected 500 for input 1, got %d", r_o); 
    b_i = 7'd2; #10; if (r_o !== 9'd492) $display("FAIL: Expected 492 for input 2, got %d", r_o); 
    b_i = 7'd3; #10; if (r_o !== 9'd485) $display("FAIL: Expected 485 for input 3, got %d", r_o); 
    b_i = 7'd4; #10; if (r_o !== 9'd477) $display("FAIL: Expected 477 for input 4, got %d", r_o); 
    b_i = 7'd5; #10; if (r_o !== 9'd470) $display("FAIL: Expected 470 for input 5, got %d", r_o); 
    b_i = 7'd6; #10; if (r_o !== 9'd463) $display("FAIL: Expected 463 for input 6, got %d", r_o); 
    b_i = 7'd7; #10; if (r_o !== 9'd455) $display("FAIL: Expected 455 for input 7, got %d", r_o); 
    b_i = 7'd8; #10; if (r_o !== 9'd448) $display("FAIL: Expected 448 for input 8, got %d", r_o); 
    b_i = 7'd9; #10; if (r_o !== 9'd441) $display("FAIL: Expected 441 for input 9, got %d", r_o); 
    b_i = 7'd10; #10; if (r_o !== 9'd434) $display("FAIL: Expected 434 for input 10, got %d", r_o); 
    b_i = 7'd63; #10; if (r_o !== 9'd172) $display("FAIL: Expected 172 for input 63, got %d", r_o); 
    b_i = 7'd127; #10; if (r_o !== 9'd1) $display("FAIL: Expected 1 for input 127, got %d", r_o); 

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule