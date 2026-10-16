`timescale 1ns/1ps

module tb_alu1;

  reg [31:0] a;
  reg [31:0] y;
  reg [3:0] alu_sel;
  wire [31:0] alu_out;
  wire carryout;

  alu1 uut (
    .a(a),
    .y(y),
    .alu_sel(alu_sel),
    .alu_out(alu_out),
    .carryout(carryout)
  );

  initial begin
    // Test addition
    a = 32'h00000001; y = 32'h00000001; alu_sel = 4'b0000; #10;
    if (alu_out !== 32'h00000002 || carryout !== 1'b0) $display("FAIL: Addition test failed");

    // Test subtraction
    a = 32'h00000002; y = 32'h00000001; alu_sel = 4'b0001; #10;
    if (alu_out !== 32'h00000001 || carryout !== 1'b0) $display("FAIL: Subtraction test failed");

    // Test multiplication
    a = 32'h00000002; y = 32'h00000003; alu_sel = 4'b0010; #10;
    if (alu_out !== 32'h00000006 || carryout !== 1'b0) $display("FAIL: Multiplication test failed");

    // Test division
    a = 32'h00000006; y = 32'h00000003; alu_sel = 4'b0011; #10;
    if (alu_out !== 32'h00000002 || carryout !== 1'b0) $display("FAIL: Division test failed");

    // Test logical shift left
    a = 32'h00000001; alu_sel = 4'b0100; #10;
    if (alu_out !== 32'h00000002) $display("FAIL: Logical shift left test failed");

    // Test logical shift right
    a = 32'h00000002; alu_sel = 4'b0101; #10;
    if (alu_out !== 32'h00000001) $display("FAIL: Logical shift right test failed");

    // Test rotate left
    a = 32'h00000001; alu_sel = 4'b0110; #10;
    if (alu_out !== 32'h00000002) $display("FAIL: Rotate left test failed");

    // Test rotate right
    a = 32'h00000002; alu_sel = 4'b0111; #10;
    if (alu_out !== 32'h00000001) $display("FAIL: Rotate right test failed");

    // Test logical AND
    a = 32'hFFFFFFFF; y = 32'h0F0F0F0F; alu_sel = 4'b1000; #10;
    if (alu_out !== 32'h0F0F0F0F) $display("FAIL: Logical AND test failed");

    // Test logical OR
    a = 32'h0F0F0F0F; y = 32'hFFFFFFFF; alu_sel = 4'b1001; #10;
    if (alu_out !== 32'hFFFFFFFF) $display("FAIL: Logical OR test failed");

    // Test logical NOR
    a = 32'h0F0F0F0F; y = 32'hFFFFFFFF; alu_sel = 4'b1010; #10;
    if (alu_out !== 32'hF0F0F0F0) $display("FAIL: Logical NOR test failed");

    // Test logical NAND
    a = 32'h0F0F0F0F; y = 32'hFFFFFFFF; alu_sel = 4'b1011; #10;
    if (alu_out !== 32'hF0F0F0F0) $display("FAIL: Logical NAND test failed");

    // Test logical XOR
    a = 32'h0F0F0F0F; y = 32'hFFFFFFFF; alu_sel = 4'b1100; #10;
    if (alu_out !== 32'hF0F0F0F0) $display("FAIL: Logical XOR test failed");

    // Test logical XNOR
    a = 32'h0F0F0F0F; y = 32'hFFFFFFFF; alu_sel = 4'b1101; #10;
    if (alu_out !== 32'h0F0F0F0F) $display("FAIL: Logical XNOR test failed");

    // Test greater comparison
    a = 32'h00000002; y = 32'h00000001; alu_sel = 4'b1110; #10;
    if (alu_out !== 32'h00000001) $display("FAIL: Greater comparison test failed");

    // Test equal comparison
    a = 32'h00000001; y = 32'h00000001; alu_sel = 4'b1111; #10;
    if (alu_out !== 32'h00000001) $display("FAIL: Equal comparison test failed");

    $display("PASS");
    $finish;
  end

endmodule