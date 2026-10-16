`timescale 1ns/1ps

module tb_mem;

   reg clk;
   reg wr;
   reg [9:0] addr;
   reg [7:0] d_i;
   wire [7:0] d_o;

   // Instantiate the module under test (uut)
   mem uut (
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

   // Test procedure
   initial begin
      // Initialize signals
      wr = 0;
      addr = 10'b0;
      d_i = 8'b0;

      // Test 1: Write to address 0
      addr = 10'd0;
      d_i = 8'hAA; // Data to write
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle
      if (d_o !== 8'hAA) begin
         $display("FAIL: Expected d_o = 0xAA at addr 0, got d_o = 0x%h", d_o);
         $finish;
      end

      // Test 2: Write to address 1
      addr = 10'd1;
      d_i = 8'hBB; // Data to write
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle
      if (d_o !== 8'hBB) begin
         $display("FAIL: Expected d_o = 0xBB at addr 1, got d_o = 0x%h", d_o);
         $finish;
      end

      // Test 3: Write to address 2 and read back
      addr = 10'd2;
      d_i = 8'hCC; // Data to write
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle
      if (d_o !== 8'hCC) begin
         $display("FAIL: Expected d_o = 0xCC at addr 2, got d_o = 0x%h", d_o);
         $finish;
      end

      // Test 4: Verify that previous writes are retained
      addr = 10'd0;
      #10; // Wait for one clock cycle
      if (d_o !== 8'hAA) begin
         $display("FAIL: Expected d_o = 0xAA at addr 0, got d_o = 0x%h", d_o);
         $finish;
      end

      addr = 10'd1;
      #10; // Wait for one clock cycle
      if (d_o !== 8'hBB) begin
         $display("FAIL: Expected d_o = 0xBB at addr 1, got d_o = 0x%h", d_o);
         $finish;
      end

      addr = 10'd2;
      #10; // Wait for one clock cycle
      if (d_o !== 8'hCC) begin
         $display("FAIL: Expected d_o = 0xCC at addr 2, got d_o = 0x%h", d_o);
         $finish;
      end

      // Test 5: Write to a different address and check
      addr = 10'd3;
      d_i = 8'hDD; // Data to write
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle
      if (d_o !== 8'hDD) begin
         $display("FAIL: Expected d_o = 0xDD at addr 3, got d_o = 0x%h", d_o);
         $finish;
      end

      // End of tests
      $display("PASS");
      $finish;
   end

endmodule