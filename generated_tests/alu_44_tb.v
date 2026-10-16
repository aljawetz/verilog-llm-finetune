`timescale 1ns/1ps

module tb_alu;
  reg [7:0] a;
  reg [7:0] b;
  reg cin;
  wire [7:0] out;

  // Instantiate the ALU module
  alu uut (
    .out(out),
    .a(a),
    .b(b),
    .cin(cin)
  );

  initial begin
    // Test case 1: Simple addition without carry
    a = 8'h01; b = 8'h02; cin = 1'b0;
    #10;
    if (out !== 8'h03) $display("FAIL: Test case 1 failed, expected 0x03, got %h", out);

    // Test case 2: Addition with carry
    a = 8'hFF; b = 8'h01; cin = 1'b0;
    #10;
    if (out !== 8'h00) $display("FAIL: Test case 2 failed, expected 0x00, got %h", out);

    // Test case 3: Addition with carry-in
    a = 8'h7F; b = 8'h01; cin = 1'b1;
    #10;
    if (out !== 8'h81) $display("FAIL: Test case 3 failed, expected 0x81, got %h", out);

    // Test case 4: Adding two zeros
    a = 8'h00; b = 8'h00; cin = 1'b0;
    #10;
    if (out !== 8'h00) $display("FAIL: Test case 4 failed, expected 0x00, got %h", out);

    // Test case 5: Adding maximum values
    a = 8'hFF; b = 8'hFF; cin = 1'b1;
    #10;
    if (out !== 8'hFE) $display("FAIL: Test case 5 failed, expected 0xFE, got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule