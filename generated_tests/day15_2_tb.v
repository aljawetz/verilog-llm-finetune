`timescale 1ns/1ps

module tb_day15;

  reg [3:0] req_i;
  wire [3:0] grant_o;

  // Instantiate the module under test
  day15 uut (
    .req_i(req_i),
    .grant_o(grant_o)
  );

  initial begin
    // Test case 1: Only the first request is active
    req_i = 4'b0001; // Request 0
    #10;
    if (grant_o !== 4'b0001) begin
      $display("FAIL: Test case 1 failed, expected grant_o = 4'b0001, got grant_o = %b", grant_o);
      $finish;
    end

    // Test case 2: Second request is active
    req_i = 4'b0010; // Request 1
    #10;
    if (grant_o !== 4'b0010) begin
      $display("FAIL: Test case 2 failed, expected grant_o = 4'b0010, got grant_o = %b", grant_o);
      $finish;
    end

    // Test case 3: First and second requests are active
    req_i = 4'b0011; // Requests 0 and 1
    #10;
    if (grant_o !== 4'b0001) begin
      $display("FAIL: Test case 3 failed, expected grant_o = 4'b0001, got grant_o = %b", grant_o);
      $finish;
    end

    // Test case 4: Third request is active
    req_i = 4'b0100; // Request 2
    #10;
    if (grant_o !== 4'b0100) begin
      $display("FAIL: Test case 4 failed, expected grant_o = 4'b0100, got grant_o = %b", grant_o);
      $finish;
    end

    // Test case 5: Requests 1 and 2 are active
    req_i = 4'b0110; // Requests 1 and 2
    #10;
    if (grant_o !== 4'b0010) begin
      $display("FAIL: Test case 5 failed, expected grant_o = 4'b0010, got grant_o = %b", grant_o);
      $finish;
    end

    // Test case 6: All requests are active
    req_i = 4'b1111; // Requests 0, 1, 2, and 3
    #10;
    if (grant_o !== 4'b0001) begin
      $display("FAIL: Test case 6 failed, expected grant_o = 4'b0001, got grant_o = %b", grant_o);
      $finish;
    end

    // Test case 7: No requests are active
    req_i = 4'b0000; // No requests
    #10;
    if (grant_o !== 4'b0000) begin
      $display("FAIL: Test case 7 failed, expected grant_o = 4'b0000, got grant_o = %b", grant_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule