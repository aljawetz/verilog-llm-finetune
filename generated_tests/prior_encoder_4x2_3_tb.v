`timescale 1ns/1ps

module tb_prior_encoder_4x2;

reg [3:0] y;
wire [1:0] a;

// Instantiate the module under test (uut)
prior_encoder_4x2 uut (
    .y(y),
    .a(a)
);

initial begin
    // Test case 1: y = 4'b1000 (y[3] high)
    y = 4'b1000;
    #10;
    if (a !== 2'b11) begin
        $display("FAIL: Expected a = 3'b011 for y = 4'b1000, got a = %b", a);
        $finish;
    end

    // Test case 2: y = 4'b0100 (y[2] high)
    y = 4'b0100;
    #10;
    if (a !== 2'b10) begin
        $display("FAIL: Expected a = 3'b010 for y = 4'b0100, got a = %b", a);
        $finish;
    end

    // Test case 3: y = 4'b0010 (y[1] high)
    y = 4'b0010;
    #10;
    if (a !== 2'b01) begin
        $display("FAIL: Expected a = 3'b001 for y = 4'b0010, got a = %b", a);
        $finish;
    end

    // Test case 4: y = 4'b0001 (no high input)
    y = 4'b0000;
    #10;
    if (a !== 2'b00) begin
        $display("FAIL: Expected a = 3'b000 for y = 4'b0000, got a = %b", a);
        $finish;
    end

    // Test case 5: y = 4'b0001 (no high input)
    y = 4'b0001;
    #10;
    if (a !== 2'b00) begin
        $display("FAIL: Expected a = 3'b000 for y = 4'b0001, got a = %b", a);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule