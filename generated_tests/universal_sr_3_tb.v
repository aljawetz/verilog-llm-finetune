`timescale 1ns/1ps

module tb_universal_sr;

  reg clr;
  reg clk;
  reg [1:0] sel;
  reg [3:0] M;
  wire [3:0] Q;

  // Instantiate the module under test (uut)
  universal_sr uut (
    .clr(clr),
    .clk(clk),
    .sel(sel),
    .M(M),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    clr = 1;
    sel = 2'b00;
    M = 4'b0000;
    #10; // Wait for clock edge

    // Release reset
    clr = 0;
    #10;

    // Test case 1: Hold state (sel = 00)
    sel = 2'b00;
    #10;
    if (Q !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected Q=0000, got Q=%b", Q);
      $finish;
    end

    // Test case 2: Load M into Q (sel = 11)
    M = 4'b1010;
    sel = 2'b11;
    #10;
    if (Q !== 4'b1010) begin
      $display("FAIL: Test case 2 failed, expected Q=1010, got Q=%b", Q);
      $finish;
    end

    // Test case 3: Shift left (sel = 01)
    sel = 2'b01;
    #10;
    if (Q !== {M[0], M[3:1]}) begin
      $display("FAIL: Test case 3 failed, expected Q=%b, got Q=%b", {M[0], M[3:1]}, Q);
      $finish;
    end

    // Test case 4: Shift right (sel = 10)
    sel = 2'b10;
    #10;
    if (Q !== {M[2:0], M[3]}) begin
      $display("FAIL: Test case 4 failed, expected Q=%b, got Q=%b", {M[2:0], M[3]}, Q);
      $finish;
    end

    // Test case 5: Clear Q (clr = 1)
    clr = 1;
    #10;
    if (Q !== 4'b0000) begin
      $display("FAIL: Test case 5 failed, expected Q=0000, got Q=%b", Q);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule