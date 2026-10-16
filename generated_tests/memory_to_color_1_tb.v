`timescale 1ns/1ps

module tb_memory_to_color;

  reg [1:0] color_depth_i;
  reg [31:0] mem_i;
  reg [1:0] mem_lsb_i;
  wire [31:0] color_o;
  wire [3:0] sel_o;

  memory_to_color uut (
    .color_depth_i(color_depth_i),
    .mem_i(mem_i),
    .mem_lsb_i(mem_lsb_i),
    .color_o(color_o),
    .sel_o(sel_o)
  );

  initial begin
    // Test 1: 8-bit color depth, LSB 0
    color_depth_i = 2'b00; mem_i = 32'hAABBCCDD; mem_lsb_i = 2'b00;
    #10;
    if (color_o !== 32'hAA || sel_o !== 4'b0001) begin
      $display("FAIL: Test 1 failed");
      $finish;
    end

    // Test 2: 8-bit color depth, LSB 1
    mem_lsb_i = 2'b01;
    #10;
    if (color_o !== 32'hBB || sel_o !== 4'b0001) begin
      $display("FAIL: Test 2 failed");
      $finish;
    end

    // Test 3: 8-bit color depth, LSB 2
    mem_lsb_i = 2'b10;
    #10;
    if (color_o !== 32'hCC || sel_o !== 4'b0001) begin
      $display("FAIL: Test 3 failed");
      $finish;
    end

    // Test 4: 8-bit color depth, LSB 3
    mem_lsb_i = 2'b11;
    #10;
    if (color_o !== 32'hDD || sel_o !== 4'b0001) begin
      $display("FAIL: Test 4 failed");
      $finish;
    end

    // Test 5: 16-bit color depth, LSB 0
    color_depth_i = 2'b01; mem_i = 32'hAABBCCDD; mem_lsb_i = 2'b00;
    #10;
    if (color_o !== 32'hAABB || sel_o !== 4'b0011) begin
      $display("FAIL: Test 5 failed");
      $finish;
    end

    // Test 6: 16-bit color depth, LSB 1
    mem_lsb_i = 2'b01;
    #10;
    if (color_o !== 32'hCCDD || sel_o !== 4'b0011) begin
      $display("FAIL: Test 6 failed");
      $finish;
    end

    // Test 7: 32-bit color depth
    color_depth_i = 2'b10; mem_i = 32'hAABBCCDD; mem_lsb_i = 2'b00;
    #10;
    if (color_o !== 32'hAABBCCDD || sel_o !== 4'b1111) begin
      $display("FAIL: Test 7 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule