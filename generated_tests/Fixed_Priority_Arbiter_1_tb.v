`timescale 1ns/1ps

module tb_Fixed_Priority_Arbiter;

  reg [3:0] request;
  wire [3:0] grant;

  // Instantiate the module under test
  Fixed_Priority_Arbiter uut (
    .request(request),
    .grant(grant)
  );

  initial begin
    // Test sequence
    request = 4'b0000; #10;
    if (grant !== 4'b0000) begin
      $display("FAIL: Expected grant 0000 for request 0000, got %b", grant);
      $finish;
    end

    request = 4'b0001; #10;
    if (grant !== 4'b0001) begin
      $display("FAIL: Expected grant 0001 for request 0001, got %b", grant);
      $finish;
    end

    request = 4'b0010; #10;
    if (grant !== 4'b0010) begin
      $display("FAIL: Expected grant 0010 for request 0010, got %b", grant);
      $finish;
    end

    request = 4'b0100; #10;
    if (grant !== 4'b0100) begin
      $display("FAIL: Expected grant 0100 for request 0100, got %b", grant);
      $finish;
    end

    request = 4'b1000; #10;
    if (grant !== 4'b1000) begin
      $display("FAIL: Expected grant 1000 for request 1000, got %b", grant);
      $finish;
    end

    request = 4'b1100; #10;
    if (grant !== 4'b1000) begin
      $display("FAIL: Expected grant 1000 for request 1100, got %b", grant);
      $finish;
    end

    request = 4'b0110; #10;
    if (grant !== 4'b0100) begin
      $display("FAIL: Expected grant 0100 for request 0110, got %b", grant);
      $finish;
    end

    request = 4'b1110; #10;
    if (grant !== 4'b1000) begin
      $display("FAIL: Expected grant 1000 for request 1110, got %b", grant);
      $finish;
    end

    request = 4'b1010; #10;
    if (grant !== 4'b1000) begin
      $display("FAIL: Expected grant 1000 for request 1010, got %b", grant);
      $finish;
    end

    request = 4'b0011; #10;
    if (grant !== 4'b0010) begin
      $display("FAIL: Expected grant 0010 for request 0011, got %b", grant);
      $finish;
    end

    request = 4'b1111; #10;
    if (grant !== 4'b1000) begin
      $display("FAIL: Expected grant 1000 for request 1111, got %b", grant);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule