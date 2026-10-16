`timescale 1ns/1ps

module tb_encoder_8_3;

reg [7:0] A;
wire [2:0] y;

// Instantiate the module under test
encoder_8_3 uut (
    .A(A),
    .y(y)
);

initial begin
    // Test case 1: Input is 8'b10000000, expecting output 3'd7
    A = 8'b10000000; #10;
    if (y !== 3'd7) begin
        $display("FAIL: Expected 3'd7 for input 8'b10000000, got %b", y);
        $finish;
    end

    // Test case 2: Input is 8'b01000000, expecting output 3'd6
    A = 8'b01000000; #10;
    if (y !== 3'd6) begin
        $display("FAIL: Expected 3'd6 for input 8'b01000000, got %b", y);
        $finish;
    end

    // Test case 3: Input is 8'b00100000, expecting output 3'd5
    A = 8'b00100000; #10;
    if (y !== 3'd5) begin
        $display("FAIL: Expected 3'd5 for input 8'b00100000, got %b", y);
        $finish;
    end

    // Test case 4: Input is 8'b00010000, expecting output 3'd4
    A = 8'b00010000; #10;
    if (y !== 3'd4) begin
        $display("FAIL: Expected 3'd4 for input 8'b00010000, got %b", y);
        $finish;
    end

    // Test case 5: Input is 8'b00001000, expecting output 3'd3
    A = 8'b00001000; #10;
    if (y !== 3'd3) begin
        $display("FAIL: Expected 3'd3 for input 8'b00001000, got %b", y);
        $finish;
    end

    // Test case 6: Input is 8'b00000100, expecting output 3'd2
    A = 8'b00000100; #10;
    if (y !== 3'd2) begin
        $display("FAIL: Expected 3'd2 for input 8'b00000100, got %b", y);
        $finish;
    end

    // Test case 7: Input is 8'b00000010, expecting output 3'd1
    A = 8'b00000010; #10;
    if (y !== 3'd1) begin
        $display("FAIL: Expected 3'd1 for input 8'b00000010, got %b", y);
        $finish;
    end

    // Test case 8: Input is 8'b00000001, expecting output 3'd0
    A = 8'b00000001; #10;
    if (y !== 3'd0) begin
        $display("FAIL: Expected 3'd0 for input 8'b00000001, got %b", y);
        $finish;
    end

    // Test case 9: Input is invalid (more than one bit set), expecting output 3'bxxx
    A = 8'b00000011; #10;
    if (y !== 3'bxxx) begin
        $display("FAIL: Expected 3'bxxx for input 8'b00000011, got %b", y);
        $finish;
    end

    // Test case 10: Input is all zeros, expecting output 3'bxxx
    A = 8'b00000000; #10;
    if (y !== 3'bxxx) begin
        $display("FAIL: Expected 3'bxxx for input 8'b00000000, got %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule