`timescale 1ns/1ps

module tb_mem_disp;

   reg clk;
   reg wr;
   reg [9:0] addr;
   reg d_i;
   wire d_o;

   // Instantiate the module under test (uut)
   mem_disp uut (
       .clk(clk),
       .wr(wr),
       .addr(addr),
       .d_i(d_i),
       .d_o(d_o)
   );

   // Clock generation
   initial begin
       clk = 0;
       forever #5 clk = ~clk; // 10ns clock period
   end

   // Test sequence
   initial begin
       // Initialize inputs
       wr = 0;
       addr = 10'b0;
       d_i = 0;

       // Test writing to memory
       wr = 1; addr = 10'd0; d_i = 1; #10; // Write 1 to address 0
       wr = 0; #10; // Wait for a clock cycle

       // Check if the output is correct
       if (d_o !== 1) begin
           $display("FAIL: Expected d_o = 1 at addr 0, got d_o = %b", d_o);
           $finish;
       end

       // Write to another address
       wr = 1; addr = 10'd1; d_i = 0; #10; // Write 0 to address 1
       wr = 0; #10; // Wait for a clock cycle

       // Check if the output is correct
       if (d_o !== 0) begin
           $display("FAIL: Expected d_o = 0 at addr 1, got d_o = %b", d_o);
           $finish;
       end

       // Write to address 2
       wr = 1; addr = 10'd2; d_i = 1; #10; // Write 1 to address 2
       wr = 0; #10; // Wait for a clock cycle

       // Check if the output is correct
       addr = 10'd2; #10; // Set addr to 2 and wait
       if (d_o !== 1) begin
           $display("FAIL: Expected d_o = 1 at addr 2, got d_o = %b", d_o);
           $finish;
       end

       // Write to address 3
       wr = 1; addr = 10'd3; d_i = 1; #10; // Write 1 to address 3
       wr = 0; #10; // Wait for a clock cycle

       // Check if the output is correct
       addr = 10'd3; #10; // Set addr to 3 and wait
       if (d_o !== 1) begin
           $display("FAIL: Expected d_o = 1 at addr 3, got d_o = %b", d_o);
           $finish;
       end

       // Write to address 0 again
       wr = 1; addr = 10'd0; d_i = 0; #10; // Write 0 to address 0
       wr = 0; #10; // Wait for a clock cycle

       // Check if the output is correct
       addr = 10'd0; #10; // Set addr to 0 and wait
       if (d_o !== 0) begin
           $display("FAIL: Expected d_o = 0 at addr 0, got d_o = %b", d_o);
           $finish;
       end

       // If all tests pass
       $display("PASS");
       $finish;
   end

endmodule