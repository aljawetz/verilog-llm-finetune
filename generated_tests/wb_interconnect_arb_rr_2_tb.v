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
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    // Initialize inputs
    req = 2'b00;
    gnt = 2'b01; // Initial grant to the first participant

    // Wait for a clock cycle
    #10;

    // Test case 1: Only first participant requests
    req = 2'b01; gnt = 2'b01; #10;
    if (nxt_gnt !== 2'b01) $display("FAIL: Test case 1 failed, expected nxt_gnt = 01, got %b", nxt_gnt);

    // Test case 2: Second participant requests
    req = 2'b10; gnt = 2'b01; #10;
    if (nxt_gnt !== 2'b10) $display("FAIL: Test case 2 failed, expected nxt_gnt = 10, got %b", nxt_gnt);

    // Test case 3: Both participants request
    req = 2'b11; gnt = 2'b10; #10;
    if (nxt_gnt !== 2'b01) $display("FAIL: Test case 3 failed, expected nxt_gnt = 01, got %b", nxt_gnt);

    // Test case 4: No requests
    req = 2'b00; gnt = 2'b01; #10;
    if (nxt_gnt !== 2'b01) $display("FAIL: Test case 4 failed, expected nxt_gnt = 01, got %b", nxt_gnt);

    // Test case 5: Grant to second participant
    req = 2'b01; gnt = 2'b10; #10;
    if (nxt_gnt !== 2'b10) $display("FAIL: Test case 5 failed, expected nxt_gnt = 10, got %b", nxt_gnt);

    // Test case 6: Grant to first participant with no requests
    req = 2'b00; gnt = 2'b01; #10;
    if (nxt_gnt !== 2'b01) $display("FAIL: Test case 6 failed, expected nxt_gnt = 01, got %b", nxt_gnt);

    // Test case 7: Grant to second participant with no requests
    req = 2'b00; gnt = 2'b10; #10;
    if (nxt_gnt !== 2'b10) $display("FAIL: Test case 7 failed, expected nxt_gnt = 10, got %b", nxt_gnt);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule