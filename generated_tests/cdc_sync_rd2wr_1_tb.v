`timescale 1ns/1ps

module tb_cdc_sync_rd2wr;

   parameter ADDRSIZE = 4;
   reg wr_clk;
   reg wr_rst;
   reg [ADDRSIZE:0] rd_ptr;
   wire [ADDRSIZE:0] wrq2_rdptr;

   // Instantiate the module under test (uut)
   cdc_sync_rd2wr uut (
      .wrq2_rdptr(wrq2_rdptr),
      .rd_ptr(rd_ptr),
      .wr_clk(wr_clk),
      .wr_rst(wr_rst)
   );

   // Clock generation
   initial begin
      wr_clk = 0;
      forever #5 wr_clk = ~wr_clk; // 10ns clock period
   end

   // Test sequence
   initial begin
      // Initialize reset
      wr_rst = 0;
      rd_ptr = 5'b00000;
      #10; // Wait for 10ns
      wr_rst = 1; // Release reset
      #10;

      // Test case 1: Check initial state after reset
      if (wrq2_rdptr !== 5'b00000) begin
         $display("FAIL: Initial state after reset is incorrect");
         $finish;
      end

      // Test case 2: Write rd_ptr value and check wrq2_rdptr
      rd_ptr = 5'b00001; // Set rd_ptr to 1
      #10; // Wait for clock edge
      if (wrq2_rdptr !== 5'b00000) begin
         $display("FAIL: wrq2_rdptr should be 0 after first clock edge");
         $finish;
      end

      // Test case 3: Update rd_ptr and check wrq2_rdptr
      rd_ptr = 5'b00010; // Set rd_ptr to 2
      #10; // Wait for clock edge
      if (wrq2_rdptr !== 5'b00001) begin
         $display("FAIL: wrq2_rdptr should be 1 after second clock edge");
         $finish;
      end

      // Test case 4: Update rd_ptr again and check wrq2_rdptr
      rd_ptr = 5'b00011; // Set rd_ptr to 3
      #10; // Wait for clock edge
      if (wrq2_rdptr !== 5'b00010) begin
         $display("FAIL: wrq2_rdptr should be 2 after third clock edge");
         $finish;
      end

      // Test case 5: Reset the system
      wr_rst = 0; // Assert reset
      #10;
      wr_rst = 1; // Release reset
      #10;

      // Check state after reset
      if (wrq2_rdptr !== 5'b00000) begin
         $display("FAIL: State after reset is incorrect");
         $finish;
      end

      // End of test
      $display("PASS");
      $finish;
   end

endmodule