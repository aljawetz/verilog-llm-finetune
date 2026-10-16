`timescale 1ns/1ps

module tb_yazmac_obegi;

   reg clk_i;
   reg rst_i;
   reg [4:0] oku1_adr_i;
   reg [4:0] oku2_adr_i;
   wire [31:0] oku1_deger_o;
   wire [31:0] oku2_deger_o;
   reg [4:0] yaz_adr_i;
   reg [31:0] yaz_deger_i;
   reg yaz_i;

   // Instantiate the module under test
   yazmac_obegi uut (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .oku1_adr_i(oku1_adr_i),
      .oku2_adr_i(oku2_adr_i),
      .oku1_deger_o(oku1_deger_o),
      .oku2_deger_o(oku2_deger_o),
      .yaz_adr_i(yaz_adr_i),
      .yaz_deger_i(yaz_deger_i),
      .yaz_i(yaz_i)
   );

   // Clock generation
   initial begin
      clk_i = 0;
      forever #5 clk_i = ~clk_i; // 10ns clock period
   end

   // Test sequence
   initial begin
      // Initialize signals
      rst_i = 1;
      yaz_i = 0;
      oku1_adr_i = 5'b00000; // Read from register 0
      oku2_adr_i = 5'b00010; // Read from register 2
      yaz_adr_i = 5'b00001; // Write to register 1
      yaz_deger_i = 32'hDEADBEEF;

      // Reset the module
      #10;
      rst_i = 0;

      // Check initial values after reset
      #10;
      if (oku1_deger_o !== 32'h00000000) begin
         $display("FAIL: Register 0 should be 0 after reset");
         $finish;
      end
      if (oku2_deger_o !== 32'h40060000) begin
         $display("FAIL: Register 2 should be 0x40060000 after reset");
         $finish;
      end

      // Write to register 1
      yaz_i = 1;
      #10;
      if (oku1_deger_o !== 32'h00000000) begin
         $display("FAIL: Register 0 should still be 0");
         $finish;
      end
      if (oku2_deger_o !== 32'h40060000) begin
         $display("FAIL: Register 2 should still be 0x40060000");
         $finish;
      end

      // Check register 1 after write
      #10;
      yaz_i = 0; // Disable write
      oku1_adr_i = 5'b00001; // Read from register 1
      #10;
      if (oku1_deger_o !== 32'hDEADBEEF) begin
         $display("FAIL: Register 1 should be 0xDEADBEEF after write");
         $finish;
      end

      // Attempt to write to register 0 (should not change)
      yaz_adr_i = 5'b00000; // Write to register 0
      yaz_deger_i = 32'hFFFFFFFF; // Some value
      yaz_i = 1; // Enable write
      #10;
      yaz_i = 0; // Disable write
      oku1_adr_i = 5'b00000; // Read from register 0
      #10;
      if (oku1_deger_o !== 32'h00000000) begin
         $display("FAIL: Register 0 should still be 0 after attempted write");
         $finish;
      end

      // Final check for register 1
      oku1_adr_i = 5'b00001; // Read from register 1
      #10;
      if (oku1_deger_o !== 32'hDEADBEEF) begin
         $display("FAIL: Register 1 should still be 0xDEADBEEF");
         $finish;
      end

      // If all checks pass
      $display("PASS");
      $finish;
   end

endmodule