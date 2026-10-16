`timescale 1ns/1ps

module tb_day15;

  reg [3:0] req_i;
  wire [3:0] grant_o;

  // Instantiate the module under test (uut)
  day15 uut (
    .req_i(req_i),
    .grant_o(grant_o)
  );

  initial begin
    // Test sequence
    req_i = 4'b0000; #10; // No requests
    if (grant_o !== 4'b0000) $display("FAIL: Expected grant_o = 0000, got %b", grant_o);

    req_i = 4'b0001; #10; // Request 0
    if (grant_o !== 4'b0001) $display("FAIL: Expected grant_o = 0001, got %b", grant_o);

    req_i = 4'b0010; #10; // Request 1
    if (grant_o !== 4'b0010) $display("FAIL: Expected grant_o = 0010, got %b", grant_o);

    req_i = 4'b0100; #10; // Request 2
    if (grant_o !== 4'b0100) $display("FAIL: Expected grant_o = 0100, got %b", grant_o);

    req_i = 4'b1000; #10; // Request 3
    if (grant_o !== 4'b1000) $display("FAIL: Expected grant_o = 1000, got %b", grant_o);

    req_i = 4'b1100; #10; // Requests 2 and 3
    if (grant_o !== 4'b1000) $display("FAIL: Expected grant_o = 1000, got %b", grant_o);

    req_i = 4'b1010; #10; // Requests 1 and 3
    if (grant_o !== 4'b1000) $display("FAIL: Expected grant_o = 1000, got %b", grant_o);

    req_i = 4'b0110; #10; // Requests 1 and 2
    if (grant_o !== 4'b0100) $display("FAIL: Expected grant_o = 0100, got %b", grant_o);

    req_i = 4'b1111; #10; // All requests
    if (grant_o !== 4'b1000) $display("FAIL: Expected grant_o = 1000, got %b", grant_o);

    $display("PASS");
    $finish;
  end

endmodule