`timescale 1ns/1ps

module tb_fixedPriorityArbiter;

  reg [3:0] request;
  wire [3:0] grant;

  // Instantiate the module under test (uut)
  fixedPriorityArbiter uut (
    .request(request),
    .grant(grant)
  );

  initial begin
    // Test case 1: Only request[0] is active
    request = 4'b0001; #10;
    if (grant !== 4'b0001) $display("FAIL: Test case 1 failed, expected grant = 4'b0001, got grant = %b", grant);

    // Test case 2: request[1] is active, request[0] is inactive
    request = 4'b0010; #10;
    if (grant !== 4'b0010) $display("FAIL: Test case 2 failed, expected grant = 4'b0010, got grant = %b", grant);

    // Test case 3: request[2] is active, request[0] and request[1] are inactive
    request = 4'b0100; #10;
    if (grant !== 4'b0100) $display("FAIL: Test case 3 failed, expected grant = 4'b0100, got grant = %b", grant);

    // Test case 4: request[3] is active, request[0], request[1], and request[2] are inactive
    request = 4'b1000; #10;
    if (grant !== 4'b1000) $display("FAIL: Test case 4 failed, expected grant = 4'b1000, got grant = %b", grant);

    // Test case 5: request[1] and request[2] are active, request[0] is inactive
    request = 4'b0110; #10;
    if (grant !== 4'b0010) $display("FAIL: Test case 5 failed, expected grant = 4'b0010, got grant = %b", grant);

    // Test case 6: request[0] and request[3] are active
    request = 4'b1001; #10;
    if (grant !== 4'b0001) $display("FAIL: Test case 6 failed, expected grant = 4'b0001, got grant = %b", grant);

    // Test case 7: All requests active
    request = 4'b1111; #10;
    if (grant !== 4'b0001) $display("FAIL: Test case 7 failed, expected grant = 4'b0001, got grant = %b", grant);

    // Test case 8: No requests active
    request = 4'b0000; #10;
    if (grant !== 4'b0000) $display("FAIL: Test case 8 failed, expected grant = 4'b0000, got grant = %b", grant);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule