`timescale 1ns/1ps

module tb_bs_behav;
  reg [7:0] a;
  reg [2:0] s;
  wire [7:0] y;

  // Instantiate the module under test (uut)
  bs_behav uut (
    .a(a),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: s = 0, expect y = a
    a = 8'b10101010; s = 3'b000; #10;
    if (y !== a) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 2: s = 1, expect y = {a[0], a[7:1]}
    a = 8'b10101010; s = 3'b001; #10;
    if (y !== {a[0], a[7:1]}) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", {a[0], a[7:1]}, y);
      $finish;
    end

    // Test case 3: s = 2, expect y = {a[1:0], a[7:2]}
    a = 8'b10101010; s = 3'b010; #10;
    if (y !== {a[1:0], a[7:2]}) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", {a[1:0], a[7:2]}, y);
      $finish;
    end

    // Test case 4: s = 3, expect y = {a[2:0], a[7:3]}
    a = 8'b10101010; s = 3'b011; #10;
    if (y !== {a[2:0], a[7:3]}) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", {a[2:0], a[7:3]}, y);
      $finish;
    end

    // Test case 5: s = 4, expect y = {a[3:0], a[7:4]}
    a = 8'b10101010; s = 3'b100; #10;
    if (y !== {a[3:0], a[7:4]}) begin
      $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", {a[3:0], a[7:4]}, y);
      $finish;
    end

    // Test case 6: s = 5, expect y = {a[4:0], a[7:5]}
    a = 8'b10101010; s = 3'b101; #10;
    if (y !== {a[4:0], a[7:5]}) begin
      $display("FAIL: Test case 6 failed, expected y = %b, got y = %b", {a[4:0], a[7:5]}, y);
      $finish;
    end

    // Test case 7: s = 6, expect y = {a[5:0], a[7:6]}
    a = 8'b10101010; s = 3'b110; #10;
    if (y !== {a[5:0], a[7:6]}) begin
      $display("FAIL: Test case 7 failed, expected y = %b, got y = %b", {a[5:0], a[7:6]}, y);
      $finish;
    end

    // Test case 8: s = 7, expect y = {a[6:0], a[7]}
    a = 8'b10101010; s = 3'b111; #10;
    if (y !== {a[6:0], a[7]}) begin
      $display("FAIL: Test case 8 failed, expected y = %b, got y = %b", {a[6:0], a[7]}, y);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule