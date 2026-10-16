`timescale 1ns/1ps

module tb_wb_interconnect_arb_rr;

  // Parameters
  parameter N = 2;

  // Inputs
  reg [N-1:0] req;
  reg [N-1:0] gnt;

  // Outputs
  wire [N-1:0] nxt_gnt;

  // Instantiate the Unit Under Test (UUT)
  wb_interconnect_arb_rr #(.N(N)) uut (
    .req(req),
    .gnt(gnt),
    .nxt_gnt(nxt_gnt)
  );

  // Clock and Reset
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  initial begin
    // Initialize inputs
    req = 2'b00;
    gnt = 2'b01; // Start with grant to 1

    // Test sequence
    #10;
    req = 2'b01; gnt = 2'b01; // Request 1, grant 1
    #10;
    if (nxt_gnt !== 2'b01) begin
      $display("FAIL: Expected nxt_gnt = 01, got %b", nxt_gnt);
      $finish;
    end

    #10;
    req = 2'b11; gnt = 2'b01; // Request 0 and 1, grant 1
    #10;
    if (nxt_gnt !== 2'b10) begin
      $display("FAIL: Expected nxt_gnt = 10, got %b", nxt_gnt);
      $finish;
    end

    #10;
    req = 2'b10; gnt = 2'b10; // Request 1, grant 2
    #10;
    if (nxt_gnt !== 2'b10) begin
      $display("FAIL: Expected nxt_gnt = 10, got %b", nxt_gnt);
      $finish;
    end

    #10;
    req = 2'b11; gnt = 2'b10; // Request 0 and 1, grant 2
    #10;
    if (nxt_gnt !== 2'b01) begin
      $display("FAIL: Expected nxt_gnt = 01, got %b", nxt_gnt);
      $finish;
    end

    #10;
    req = 2'b00; gnt = 2'b01; // No request, grant 1
    #10;
    if (nxt_gnt !== 2'b01) begin
      $display("FAIL: Expected nxt_gnt = 01, got %b", nxt_gnt);
      $finish;
    end

    #10;
    req = 2'b00; gnt = 2'b10; // No request, grant 2
    #10;
    if (nxt_gnt !== 2'b10) begin
      $display("FAIL: Expected nxt_gnt = 10, got %b", nxt_gnt);
      $finish;
    end

    // Final check with no requests
    #10;
    req = 2'b00; gnt = 2'b00; // No requests, no grants
    #10;
    if (nxt_gnt !== 2'b00) begin
      $display("FAIL: Expected nxt_gnt = 00, got %b", nxt_gnt);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule