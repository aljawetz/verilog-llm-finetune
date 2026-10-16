`timescale 1ns/1ps

module tb_decoder8to3S;

reg [2:0] i;
wire [7:0] y;

// Instantiate the Unit Under Test (UUT)
decoder8to3S uut (
    .y(y),
    .i(i)
);

initial begin
    // Test case 1: Input = 3'b000
    i = 3'b000; #10;
    if (y !== 8'b00000001) begin
        $display("FAIL: Test case 1 failed for input 3'b000");
        $finish;
    end

    // Test case 2: Input = 3'b001
    i = 3'b001; #10;
    if (y !== 8'b00000010) begin
        $display("FAIL: Test case 2 failed for input 3'b001");
        $finish;
    end

    // Test case 3: Input = 3'b010
    i = 3'b010; #10;
    if (y !== 8'b00000100) begin
        $display("FAIL: Test case 3 failed for input 3'b010");
        $finish;
    end

    // Test case 4: Input = 3'b011
    i = 3'b011; #10;
    if (y !== 8'b00001000) begin
        $display("FAIL: Test case 4 failed for input 3'b011");
        $finish;
    end

    // Test case 5: Input = 3'b100
    i = 3'b100; #10;
    if (y !== 8'b00010000) begin
        $display("FAIL: Test case 5 failed for input 3'b100");
        $finish;
    end

    // Test case 6: Input = 3'b101
    i = 3'b101; #10;
    if (y !== 8'b00100000) begin
        $display("FAIL: Test case 6 failed for input 3'b101");
        $finish;
    end

    // Test case 7: Input = 3'b110
    i = 3'b110; #10;
    if (y !== 8'b01000000) begin
        $display("FAIL: Test case 7 failed for input 3'b110");
        $finish;
    end

    // Test case 8: Input = 3'b111
    i = 3'b111; #10;
    if (y !== 8'b10000000) begin
        $display("FAIL: Test case 8 failed for input 3'b111");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule