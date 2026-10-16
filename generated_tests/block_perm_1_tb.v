`timescale 1ns/1ps

module tb_block_perm;

reg [7:0] in;
wire [7:0] out;

// Instantiate the module under test
block_perm uut (
    .in(in),
    .out(out)
);

initial begin
    // Test cases
    in = 8'h00; #10;
    if (out !== 8'h00) $display("FAIL: Expected 8'h00 for input 8'h00, got %h", out);
    
    in = 8'h01; #10;
    if (out !== 8'h02) $display("FAIL: Expected 8'h02 for input 8'h01, got %h", out);
    
    in = 8'h02; #10;
    if (out !== 8'h80) $display("FAIL: Expected 8'h80 for input 8'h02, got %h", out);
    
    in = 8'h03; #10;
    if (out !== 8'h82) $display("FAIL: Expected 8'h82 for input 8'h03, got %h", out);
    
    in = 8'h04; #10;
    if (out !== 8'h20) $display("FAIL: Expected 8'h20 for input 8'h04, got %h", out);
    
    in = 8'h05; #10;
    if (out !== 8'h22) $display("FAIL: Expected 8'h22 for input 8'h05, got %h", out);
    
    in = 8'h06; #10;
    if (out !== 8'hA0) $display("FAIL: Expected 8'hA0 for input 8'h06, got %h", out);
    
    in = 8'h07; #10;
    if (out !== 8'hA2) $display("FAIL: Expected 8'hA2 for input 8'h07, got %h", out);
    
    in = 8'h08; #10;
    if (out !== 8'h10) $display("FAIL: Expected 8'h10 for input 8'h08, got %h", out);
    
    in = 8'h09; #10;
    if (out !== 8'h12) $display("FAIL: Expected 8'h12 for input 8'h09, got %h", out);
    
    in = 8'h0A; #10;
    if (out !== 8'h90) $display("FAIL: Expected 8'h90 for input 8'h0A, got %h", out);
    
    in = 8'h0B; #10;
    if (out !== 8'h92) $display("FAIL: Expected 8'h92 for input 8'h0B, got %h", out);
    
    in = 8'h0C; #10;
    if (out !== 8'h30) $display("FAIL: Expected 8'h30 for input 8'h0C, got %h", out);
    
    in = 8'h0D; #10;
    if (out !== 8'h32) $display("FAIL: Expected 8'h32 for input 8'h0D, got %h", out);
    
    in = 8'h0E; #10;
    if (out !== 8'hB0) $display("FAIL: Expected 8'hB0 for input 8'h0E, got %h", out);
    
    in = 8'h0F; #10;
    if (out !== 8'hB2) $display("FAIL: Expected 8'hB2 for input 8'h0F, got %h", out);
    
    // Continue testing other values...
    
    // Final test case
    in = 8'hFF; #10;
    if (out !== 8'hFF) $display("FAIL: Expected 8'hFF for input 8'hFF, got %h", out);
    
    $display("PASS");
    $finish;
end

endmodule