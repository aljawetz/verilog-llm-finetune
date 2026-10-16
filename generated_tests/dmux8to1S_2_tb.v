`timescale 1ns/1ps

module tb_dmux8to1S;

reg i;
reg [2:0] s;
wire [7:0] y;

// Instantiate the module under test
dmux8to1S uut (
    .y(y),
    .s(s),
    .i(i)
);

initial begin
    // Test case 1: Select line 0, input high
    i = 1;
    s = 3'b000; // Expect y[0] = 1
    #10;
    if (y !== 8'b00000001) begin
        $display("FAIL: Test case 1 failed, expected y = 00000001, got y = %b", y);
        $finish;
    end

    // Test case 2: Select line 1, input high
    s = 3'b001; // Expect y[1] = 1
    #10;
    if (y !== 8'b00000010) begin
        $display("FAIL: Test case 2 failed, expected y = 00000010, got y = %b", y);
        $finish;
    end

    // Test case 3: Select line 2, input high
    s = 3'b010; // Expect y[2] = 1
    #10;
    if (y !== 8'b00000100) begin
        $display("FAIL: Test case 3 failed, expected y = 00000100, got y = %b", y);
        $finish;
    end

    // Test case 4: Select line 3, input high
    s = 3'b011; // Expect y[3] = 1
    #10;
    if (y !== 8'b00001000) begin
        $display("FAIL: Test case 4 failed, expected y = 00001000, got y = %b", y);
        $finish;
    end

    // Test case 5: Select line 4, input high
    s = 3'b100; // Expect y[4] = 1
    #10;
    if (y !== 8'b00010000) begin
        $display("FAIL: Test case 5 failed, expected y = 00010000, got y = %b", y);
        $finish;
    end

    // Test case 6: Select line 5, input high
    s = 3'b101; // Expect y[5] = 1
    #10;
    if (y !== 8'b00100000) begin
        $display("FAIL: Test case 6 failed, expected y = 00100000, got y = %b", y);
        $finish;
    end

    // Test case 7: Select line 6, input high
    s = 3'b110; // Expect y[6] = 1
    #10;
    if (y !== 8'b01000000) begin
        $display("FAIL: Test case 7 failed, expected y = 01000000, got y = %b", y);
        $finish;
    end

    // Test case 8: Select line 7, input high
    s = 3'b111; // Expect y[7] = 1
    #10;
    if (y !== 8'b10000000) begin
        $display("FAIL: Test case 8 failed, expected y = 10000000, got y = %b", y);
        $finish;
    end

    // Test case 9: Input low, all outputs should be low
    i = 0;
    s = 3'b000; // Expect all y = 0
    #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 9 failed, expected y = 00000000, got y = %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule