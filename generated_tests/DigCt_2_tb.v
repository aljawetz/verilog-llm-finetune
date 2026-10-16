`timescale 1ns/1ps

module tb_DigCt;

reg IN1, IN2, IN3, IN4, IN5, CLK;
wire OUT1, OUT2, OUT3;

// Instantiate the module under test
DigCt uut (
    .IN1(IN1),
    .IN2(IN2),
    .IN3(IN3),
    .IN4(IN4),
    .IN5(IN5),
    .CLK(CLK),
    .OUT1(OUT1),
    .OUT2(OUT2),
    .OUT3(OUT3)
);

// Clock generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    IN1 = 0; IN2 = 0; IN3 = 0; IN4 = 0; IN5 = 0;

    // Wait for a clock edge
    #10;

    // Test case 1
    IN1 = 0; IN2 = 0; IN3 = 1; IN4 = 0; IN5 = 0; // a = 1, b = 0
    #10;
    if (OUT1 !== 1'b1) $display("FAIL: OUT1 expected 1, got %b", OUT1);
    if (OUT2 !== 1'b0) $display("FAIL: OUT2 expected 0, got %b", OUT2);

    // Test case 2
    IN1 = 1; IN2 = 1; IN3 = 1; IN4 = 0; IN5 = 0; // a = 0, b = 0
    #10;
    if (OUT1 !== 1'b0) $display("FAIL: OUT1 expected 0, got %b", OUT1);
    if (OUT2 !== 1'b0) $display("FAIL: OUT2 expected 0, got %b", OUT2);

    // Test case 3
    IN1 = 0; IN2 = 1; IN3 = 1; IN4 = 1; IN5 = 1; // a = 0, b = 0
    #10;
    if (OUT1 !== 1'b0) $display("FAIL: OUT1 expected 0, got %b", OUT1);
    if (OUT2 !== 1'b0) $display("FAIL: OUT2 expected 0, got %b", OUT2);

    // Test case 4
    IN1 = 0; IN2 = 0; IN3 = 0; IN4 = 0; IN5 = 1; // a = 1, b = 0
    #10;
    if (OUT1 !== 1'b1) $display("FAIL: OUT1 expected 1, got %b", OUT1);
    if (OUT2 !== 1'b0) $display("FAIL: OUT2 expected 0, got %b", OUT2);

    // Test case 5
    IN1 = 1; IN2 = 0; IN3 = 1; IN4 = 0; IN5 = 0; // a = 0, b = 0
    #10;
    if (OUT1 !== 1'b0) $display("FAIL: OUT1 expected 0, got %b", OUT1);
    if (OUT2 !== 1'b0) $display("FAIL: OUT2 expected 0, got %b", OUT2);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule